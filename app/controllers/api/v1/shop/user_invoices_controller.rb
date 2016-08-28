class Api::V1::Shop::UserInvoicesController < Api::ShopBaseController
  before_action :find_object, :check_conditions_to_accept_shipper?

  def update
    if InvoiceStatus.new(@invoice, @user_invoice, "waiting", current_user).accept_shipper
      render json: {message: I18n.t("invoices.accept_shipper.success"),
        data: {user_invoice: @user_invoice}, code: 1}, status: 200
    else
      render json: {message: I18n.t("invoices.accept_shipper.fail"), data: {},
        code: 0}, status: 200
    end
  end

  private
  def user_invoice_params
    params.require(:user_invoice).permit :invoice_id
  end

  def check_conditions_to_accept_shipper?
    @invoice = @user_invoice.invoice
    if !@invoice.init? || !@user_invoice.init?
      render json: {message: I18n.t("invoices.accept_shipper.fail"), data: {},
        code: 0}, status: 200
    end
  end
end
