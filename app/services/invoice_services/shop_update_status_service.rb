class InvoiceServices::ShopUpdateStatusService
  attr_reader :args

  def initialize args
    @invoice = args[:invoice]
    @user_invoice = args[:user_invoice]
    @update_status = args[:update_status]
    @current_user = args[:current_user]
  end

  def perform?
    ActiveRecord::Base.transaction do
      if @invoice.init?
        @invoice.update_attributes status: @update_status
        HistoryServices::CreateInvoiceHistoryService.new(invoice: @invoice,
          creater_id: @current_user.id).perform
        HistoryServices::CreateStatusInvoiceHistoryService.new(invoice: @invoice).perform
        if @invoice.cancel?
          @invoice.user_invoices.each do |user_invoice|
            user_invoice.rejected!
            HistoryServices::CreateUserInvoiceHistoryService.new(user_invoice: user_invoice,
              creater_id: @current_user.id, status: "rejected").perform
          end
          near_shippers = User.near([@invoice.latitude_start, @invoice.longitude_start],
            Settings.max_distance).shipper.users_online
          if near_shippers.any?
            InvoiceServices::RealtimeVisibilityInvoiceService.new(recipients: near_shippers,
              invoice: @invoice, action: Settings.realtime.remove_invoice).perform
          end
        end
      else
        @invoice.update_attributes status: @update_status
        @user_invoice.update_attributes status: @update_status
        HistoryServices::CreateAllHistoryService.new(invoice: @invoice,
          user_invoice: @user_invoice, creater_id: @current_user.id,
          status: @update_status).perform
        NotificationServices::CreateNotificationService.new(owner: @current_user,
          recipient: @user_invoice.user, status: @update_status, invoice: @invoice,
          click_action: Settings.invoice_detail).perform
      end
    end
    return true
    rescue => e
    return false
  end
end
