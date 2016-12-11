class Notifications::SendNotificationJob < ActiveJob::Base
  queue_as :default

  def perform args
    notification = args[:notification]
    owner = args[:owner]
    recipient = args[:recipient]
    status = args[:status]
    invoice = args[:invoice]
    click_action = args[:click_action]

    fcm = FCM.new Rails.application.secrets.firebase_api_key
    registration_ids = []
    recipient.user_tokens.each do |user_token|
      registration_ids << user_token.registration_id unless user_token.registration_id.nil?
    end
    text = I18n.t("notifications.#{status}", user_name: owner.name, invoice_name: invoice.name)
    if recipient.shipper?
    serializer = Invoices::ShipperInvoiceSerializer.new(invoice,
      scope: {current_user: recipient}).as_json
    else
      serializer = Invoices::ShopInvoiceSerializer.new(invoice,
        scope: {current_user: owner}).as_json
    end
    options = {notification: {title: I18n.t("notifications.app_name"), text: text,
      click_action: click_action}, data: {notification_id: notification.id,
      invoice_id: invoice.id, user: owner, invoice: serializer}}
    response = fcm.send registration_ids, options
  end
end
