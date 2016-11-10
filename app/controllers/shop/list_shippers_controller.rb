class Shop::ListShippersController < Shop::ShopBaseController
  before_action :load_invoice

  def index
    @shippers = @invoice.all_shipper
    @shippers = @shippers - current_user.black_list_users
    @shippers = ActiveModelSerializers::SerializableResource.new(@shippers,
      each_serializer: UserSerializer, scope: {invoice_id: params[:invoice_id],
      current_user: current_user})
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
