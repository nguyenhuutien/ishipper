class InvoiceServices::ShopUpdateInvoiceService
  attr_reader :args

  def initialize args
    @invoice = args[:invoice]
    @user_invoice = args[:user_invoice]
    @update_status = args[:update_status]
    @current_user = args[:current_user]
  end

  def perform?
    if ConditionUpdateStatusServices::ShopConditionService.new(invoice: @invoice,
      user_invoice: @user_invoice, update_status: @update_status,
      current_user: @current_user).perform?
      InvoiceServices::ShopUpdateStatusService.new(invoice: @invoice,
        user_invoice: @user_invoice, update_status: @update_status,
        current_user: @current_user).perform?
    else
      false
    end
  end
end
