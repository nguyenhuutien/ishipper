class NotificationServices::SendAllNotificationService
  attr_reader :args

  def initialize args
    @owner = args[:owner]
    @recipients = args[:recipients]
    @status = args[:status]
    @invoice = args[:invoice]
    @click_action = args[:click_action]
  end

  def perform
    @recipients.each do |recipient|
      NotificationServices::CreateNotificationService.new(owner: @owner, recipient: recipient,
        status: @status, invoice: @invoice, click_action: @click_action).perform
    end
  end
end
