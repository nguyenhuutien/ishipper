class CreateNotification
  attr_reader :args

  def initialize args
    @owner = args[:owner]
    @recipient = args[:recipient]
    @content = args[:content]
    @invoice = args[:invoice]
    @user_invoice = args[:user_invoice]
    @click_action = args[:click_action]
  end

  def perform
    @notification = Notification.create! owner_id: @owner.id, recipient_id: @recipient.id,
      content: @content, invoice_id: @invoice.id, user_invoice_id: @user_invoice.id,
      click_action: @click_action
    user_setting = @recipient.user_setting
    if @notification
      user_setting.update! unread_notification: user_setting.unread_notification + 1
      if user_setting.receive_notification?
        send_noti
      end
    end
  end

  private
  def send_noti
    fcm = FCM.new Rails.application.secrets.firebase_api_key
    registration_ids = []
    @recipient.user_tokens.each do |user_token|
      registration_ids << user_token.registration_id unless user_token.registration_id.nil?
    end
    text = I18n.t("notifications.#{@content}", user_name: @owner.name, invoice_name: @invoice.name)
    options = {notification: {title: I18n.t("notifications.app_name"), text: text,
      click_action: @click_action}, data: {notification_id: @notification.id, invoice_id: @invoice.id,
      user_invocie_id: @user_invoice.id}}
    response = fcm.send registration_ids, options
  end
end
