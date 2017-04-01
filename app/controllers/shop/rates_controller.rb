class Shop::RatesController < Shop::ShopBaseController
  before_action :valid_invoice, only: :create

  def new
    @rate = Review.new invoice_id: params[:invoice_id]
  end

  def create
    @rate = Review.new rate_params
    @rate.owner = current_user
    @rate.review_type = "rate"
    @rate.recipient = @recipient
    @rate.save
    @rates = @rate.invoice.reviews.rate
  end

  private
  def rate_params
    params.require(:rate).permit :content, :invoice_id, :rating_point
  end

  def valid_invoice
    invoice = Invoice.find_by id: rate_params[:invoice_id]
    if invoice
      user_invoice = invoice.user_invoices.find_by status: invoice.status
      if user_invoice
        if current_user.rate? invoice
          flash[:danger] = t "rate.exist_rate"
          redirect_to :back
        else
          @recipient = user_invoice.user
        end
      else
        flash[:danger] = t "rate.user_invoice.not_found"
        redirect_to :back
      end
    else
      flash[:danger] = t "invoices.messages.not_found"
      redirect_to :back
    end
  end
end
