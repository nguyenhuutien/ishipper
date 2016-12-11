class Shop::UserInvoicesController < Shop::ShopBaseController
  load_resource
  before_action :check_conditions_to_accept_shipper?, :check_limited_shipper,
    :check_black_list

  def update
    shop_accept_shipper = InvoiceServices::ShopAcceptShipperService.new invoice: @invoice,
      user_invoice: @user_invoice, status: "waiting", current_user: current_user
    if shop_accept_shipper.perform?
      flash[:success] = t "invoices.accept_shipper.success"
      redirect_to shop_invoice_path @invoice
    else
      flash[:danger] = t "invoices.accept_shipper.fail"
      redirect_to shop_invoice_path @invoice
    end
  end

  private
  def check_limited_shipper
    @user_invoices = @user_invoice.user.user_invoices
    user_invoices_init = @user_invoices.init
    unless @user_invoices.waiting.count < Settings.max_invoice
      shop_check_limited_shipper = ShipperReceiveLimitServices::ShopCheckLimitedShipperService.
        new user_invoices: user_invoices_init, user_id: 0
      shop_check_limited_shipper.perform
      flash[:danger] = t "user_invoices.receive_invoice.limit"
      redirect_to shop_invoice_path @invoice
    end
  end

  def check_conditions_to_accept_shipper?
    @invoice = @user_invoice.invoice
    if !@invoice.init? || !@user_invoice.init? || @invoice.user != current_user
      flash[:danger] = t "invoices.accept_shipper.fail"
      redirect_to shop_invoice_path @invoice
    end
  end
end
