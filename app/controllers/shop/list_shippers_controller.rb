class Shop::ListShippersController < Shop::ShopBaseController
  before_action :load_invoice

  def index
    @shippers = @invoice.received_shippers
    @shippers = Supports::Shipper::Shippers.new(current_user: current_user,
      users: @shippers, invoice: @invoice, params: nil).shippers
    if @shippers.blank?
      flash[:danger] = I18n.t("invoices.messages.get_shippers_fails")
      redirect_to [:shop, @invoice]
    end
  end

  private
  def load_invoice
    @invoice = current_user.invoices.find_by id: params[:invoice_id]
    if @invoice.nil?
      flash[:danger] = I18n.t("invoices.messages.invoice_not_exist")
      redirect_to shop_invoices_path
    end
  end
end
