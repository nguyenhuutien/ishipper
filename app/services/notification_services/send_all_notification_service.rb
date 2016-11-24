class NotificationServices::SendAllNotificationService
  attr_reader :args

  def initialize args
    @owner = args[:owner]
    @recipients = args[:recipients]
    @content = args[:content]
    @invoice = args[:invoice]
    @click_action = args[:click_action]
  end

  def perform
    @recipients.each do |recipient|
      NotificationServices::CreateNotificationService.new(owner: @owner, recipient: recipient,
        content: @content, invoice: @invoice, click_action: @click_action).perform
    end
  end
end
