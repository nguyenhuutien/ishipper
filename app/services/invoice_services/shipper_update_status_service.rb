class InvoiceServices::ShipperUpdateStatusService
  attr_reader :args

  def initialize args
    @invoice = args[:invoice]
    @user_invoice = args[:user_invoice]
    @status = args[:status]
    @current_user = args[:current_user]
  end

  def perform?
    ActiveRecord::Base.transaction do
      if @user_invoice.init? && @status == "rejected"
        @user_invoice.update_attributes status: @status
        HistoryServices::CreateUserInvoiceHistoryService.new(user_invoice: @user_invoice,
          creater_id: @current_user.id, status: "rejected").perform
      else
        @invoice.update_attributes status: @status
        @user_invoice.update_attributes status: @status
        HistoryServices::CreateAllHistoryService.new(invoice: @invoice,
          user_invoice: @user_invoice, creater_id: @current_user.id,
          status: @status).perform
        NotificationServices::CreateNotificationService.new(owner: @current_user,
          recipient: @invoice.user, status: @status, invoice: @invoice,
          click_action: Settings.invoice_detail).perform
      end
    end
    return true
    rescue => e
    return false
  end
end
