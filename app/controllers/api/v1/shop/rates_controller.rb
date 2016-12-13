class Api::V1::Shop::RatesController < Api::ShopBaseController
  before_action :ensure_params_exist, :find_invoice, :find_user_invoice,
    :check_rate_conditions, except: :destroy
  before_action :check_exist_rate, :check_black_list, only: :create
  before_action :find_rate, except: :create

  def create
    @rate = Review.new rate_params
    @rate.owner = current_user
    @rate.recipient = @user_invoice.user
    @rate.review_type = "rate"
    if @rate.save
      render json: {message: I18n.t("rate.create_success"),
        data: {rate: @rate}, code: 1}, status: 200
    else
      render json: {message: error_messages(@rate.errors.messages), data: {},
        code: 0}, status: 200
    end
  end

  def update
    if @rate.update_attributes rate_params
      render json: {message: I18n.t("rate.update.success"),
        data:{rate: @rate}, code: 1}, status: 200
    else
      render json: {message: error_messages(@rate.errors.messages), data: {},
        code: 0}, status: 200
    end
  end

  def destroy
    if current_user == @rate.owner && @rate.destroy
      render json: {message: I18n.t("rate.delete.success"), data: {},
        code:1}, status: 200
    else
      render json: {message: I18n.t("rate.delete.fails"), data: {},
        code:0},status: 200
    end
  end

  private
  def rate_params
    params.require(:rate).permit Review::RATE_ATTRIBUTES_PARAMS
  end

  def ensure_params_exist
    check_params = CheckParams.new attributes_params: Review::RATE_ATTRIBUTES_PARAMS,
      params: params[:rate]
    unless check_params.perform?
      render json: {message: I18n.t("rate.missing_params"), data: {}, code: 0},
        status: 422
    end
  end

  def find_invoice
    @invoice = Invoice.find_by id: params[:rate][:invoice_id], user: current_user
    if @invoice.nil?
      render json: {message: I18n.t("rate.invoice.get_invoice_fail"), data: {},
        code: 0}, status: 200
    end
  end

  def find_user_invoice
    status = @invoice.status
    @user_invoice = @invoice.user_invoices.find_by_status status
    if @user_invoice.nil?
      render json: {message: I18n.t("rate.invoice.get_user_invoice_fail"), data: {},
        code: 0}, status: 200
    end
  end

  def check_rate_conditions
    shop_condition = ConditionRateServices::ShopConditionService.new invoice: @invoice,
      user_invoice: @user_invoice, current_user: current_user
    if !shop_condition.perform?
      render json: {message: I18n.t("rate.create_fail"), data: {}, code: 0}, status: 200
    end
  end

  def check_exist_rate
    @rate = @invoice.reviews.find_by review_type: "rate", owner: current_user
    render json: {message: I18n.t("rate.exist_rate"), data: {},
      code: 0}, status: 200 if @rate
  end

  def find_rate
    @rate = Review.find_by_id params[:id]
    if @rate.nil?
      render json: {message: I18n.t("rate.not_found"), data: {},
        code: 0}, status: 200
    end
  end
end
