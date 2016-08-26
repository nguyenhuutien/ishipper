class Api::V1::Shop::ReportsController < Api::ShopBaseController
  before_action :ensure_params_true, :check_user_invoice_status,
    :check_correct_shop, :check_exist_report

  def create
    @report = Review.new report_params
    @report.owner = current_user
    @report.recipient = @user_invoice.user
    @report.invoice = @user_invoice.invoice
    if @report.save
      render json: {message: I18n.t("report.create_success"),
        data: {report: @report}, code: 1}, status: 200
    else
      render json: {message: I18n.t("report.create_fail"), data: {},
        code: 0}, status: 200
    end
  end

  private
  def report_params
    params.require(:report).permit :invoice_id, :review_type, :content
  end

  def ensure_params_true
    if params[:report].nil? or params[:report][:user_invoice_id].nil? or
      params[:report][:review_type] != "report" or params[:report][:content].nil?
      return render json:
        {message: I18n.t("api.missing_params"), data: {}, code: 0},
        status: 422
    end
  end

  def check_user_invoice_status
    @user_invoice = UserInvoice.find_by id: params[:report][:user_invoice_id]
    unless @user_invoice.nil? or @user_invoice.waiting? or
      @user_invoice.shipping? or @user_invoice.cancel?
      render json: {message: I18n.t("report.invoice.status_fail"), data: {},
        code: 0}, status: 200
    end
  end

  def check_correct_shop
    shop = @user_invoice.invoice.user
    unless shop == current_user
      render json: {message: I18n.t("report.invoice.shipper_fail"), data: {},
        code: 0}, status: 200
    end
  end

  def check_exist_report
    report = @user_invoice.invoice.reviews.find_by review_type: params[:report][:review_type]
    unless report.nil?
      render json: {message: I18n.t("report.invoice.report_exis"), data: {},
        code: 0}, status: 200
    end
  end
end
