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
    @report.recipient = @invoice.user_invoices.find_by(status: @invoice.status).user
    if @report.save
      flash[:success] = t "report.create_success"
      redirect_to :back
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
