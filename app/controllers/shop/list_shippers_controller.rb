class Shop::ListShippersController < Shop::ShopBaseController
  before_action :load_invoice

  def index
    @shippers = @invoice.received_shippers
    shippers_simple = Simples::Shipper::ShippersSimple.new object: @shippers.includes(
      :user_invoices, :user_setting), scope: {current_user: current_user, invoice: @invoice}
    @shippers = shippers_simple.simple
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
