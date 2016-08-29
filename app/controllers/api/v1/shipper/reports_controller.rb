class Api::V1::Shipper::ReportsController < Api::ShipperBaseController
  before_action :ensure_params_true, :find_invoice, :check_exist_report,
    :check_conditions_to_report

  def create
    @report = Review.new report_params
    @report.owner = current_user
    @report.recipient = @invoice.user
    @report.invoice = @invoice
    if @report.save
      InvoiceStatus.new(@invoice, @user_invoice, "cancel", current_user).
        shipper_update_status if @invoice.waiting?
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
    if params[:report].nil? || params[:report][:invoice_id].nil? ||
      params[:report][:review_type].nil? || params[:report][:content].nil?
      return render json: {message: I18n.t("api.missing_params"),
        data: {}, code: 0}, status: 422
    end
  end

  def find_invoice
    @invoice = Invoice.find_by id: params[:report][:invoice_id]
    if @invoice.nil?
      render json: {message: I18n.t("rate.invoice.get_invoice_fail"), data: {},
        code: 0}, status: 200
    end
  end

  def check_exist_report
    report = @invoice.reviews.find_by owner: current_user,
      review_type: params[:report][:review_type]
    if report
      render json: {message: I18n.t("report.invoice.report_exis"), data: {},
        code: 0}, status: 200
    end
  end

  def check_conditions_to_report
    @user_invoice = @invoice.user_invoices.find_by status: @invoice.status
    if CheckReportConditions.new(@invoice, @user_invoice, params[:report][:review_type],
      current_user).shipper_report_conditions?
      render json: {message: I18n.t("report.create_fail"), data: {},
        code: 0}, status: 200
    end
  end
end
