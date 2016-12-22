class Shop::ReportsController < Shop::ShopBaseController
  before_action :valid_invoice?, only: :create

  def new
    @report = Review.new invoice_id: params[:invoice_id]
  end

  def create
    @report = Review.new report_params
    @report.owner = current_user
    @report.rating_point = Settings.rating_point
    @report.review_type = "report"
    user_invoice = @invoice.user_invoices.find_by status: @invoice.status
    if user_invoice
      @report.recipient = user_invoice.user
      @report.save
    else
      @report.errors.add :report, t("report.invoice.status_fail")
    end
  end

  private
  def report_params
    params.require(:report).permit :content, :invoice_id
  end

  def valid_invoice?
    @invoice = Invoice.find_by id: report_params[:invoice_id]
    if @invoice
      if current_user.report? @invoice
        flash[:danger] = t "report.invoice.report_exist"
        redirect_to :back
      end
    else
      flash[:danger] = t "invoices.messages.not_found"
      redirect_to :back
    end
  end
end
