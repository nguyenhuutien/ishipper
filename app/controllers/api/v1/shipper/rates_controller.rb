class Api::V1::Shipper::RatesController < Api::ShipperBaseController
  before_action :ensure_params_exist, :check_review_type, :check_invoice_status, :check_shipper
  before_action :check_exist_rate, only: :create

  def create
    rate = Review.new rate_params
    rate.owner = current_user
    rate.recipient = @invoice.user
    if rate.save
      render json: {message: I18n.t("rate.create_success"),
        data: {rate: rate}, code: 1}, status: 200
    else
      render json: {message: I18n.t("rate.create_fail"), data: {},
        code: 0}, status: 200
    end
  end

  private
  def rate_params
    params.require(:rate).permit :invoice_id, :review_type, :rating_point, :content
  end

  def ensure_params_exist
    if params[:rate].nil? || params[:rate][:invoice_id].nil? ||
      params[:rate][:review_type] != "rate" || params[:rate][:content].nil? ||
      params[:rate][:rating_point].nil?
      render json: {message: I18n.t("api.missing_params"), data: {}, code: 0},
        status: 422
    end
  end

  def check_review_type
    unless params[:rate][:review_type] == "rate"
      render json: {message: I18n.t("rate.review_type_fail"), data: {},
        code: 0}, status: 200
    end
  end

  def check_invoice_status
    find_invoice
    unless @invoice.shipped? || @invoice.finished?
      render json: {message: I18n.t("rate.invoice.status_fail"), data: {},
        code: 0}, status: 200
    end
  end

  def check_shipper
    status = @invoice.status
    find_user_invoice status
    shipper = @user_invoice.user
    unless shipper == current_user
      render json: {message: I18n.t("rate.invoice.shipper_fail"), data: {},
        code: 0}, status: 200
    end
  end

  def check_exist_rate
    rate = Review.find_by review_type: params[:rate][:review_type], owner: current_user,
      invoice_id: params[:rate][:invoice_id]
    unless rate.nil?
      render json: {message: I18n.t("rate.exist_rate"), data: {},
        code: 0}, status: 200
    end
  end

  def find_invoice
    @invoice = Invoice.find_by id: params[:rate][:invoice_id]
    if @invoice.nil?
      render json: {message: I18n.t("rate.invoice.get_invoice_fail"), data: {},
        code: 0}, status: 200
    end
  end

  def find_user_invoice status
    @user_invoice = UserInvoice.find_by invoice_id: params[:rate][:invoice_id], status: status
    if @user_invoice.nil?
      render json: {message: I18n.t("rate.invoice.get_user_invoice_fail"), data: {},
        code: 0}, status: 200
    end
  end
end
