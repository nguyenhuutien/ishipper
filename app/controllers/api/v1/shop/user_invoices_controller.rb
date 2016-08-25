class Api::V1::Shop::UserInvoicesController < Api::ShopBaseController
  before_action :find_object

  def update
    @invoice = @user_invoice.invoice
    if InvoiceStatus.new(@invoice, @user_invoice, "waiting").accept_shipper
      render json: {message: I18n.t("user_invoices.update_success"),
        data: {user_invoice: @user_invoice}, code: 1}, status: 200
    else
      render json: {message: I18n.t("user_invoices.update_fail"), data: {},
        code: 0}, status: 200
    end
  end

  private
  def user_invoice_params
    params.require(:user_invoice).permit :invoice_id
  end
end
