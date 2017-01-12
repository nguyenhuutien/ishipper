class Notifications::SendNotificationJob < ActiveJob::Base
  queue_as :default

  def perform args
    notification = args[:notification]
    owner = args[:owner]
    recipient = args[:recipient]
    status = args[:status]
    invoice = args[:invoice]
    click_action = args[:click_action]

    fcm = FCM.new ENV["FIREBASE_API_KEY"]
    registration_ids = []
    recipient.user_tokens.each do |user_token|
      registration_ids << user_token.registration_id unless user_token.registration_id.nil?
    end
    text = I18n.t("notifications.#{status}", user_name: owner.name, invoice_name: invoice.name)
    if recipient.shipper?
      invoice_simple = Simples::InvoicesSimple.new object: invoice,
        scope: {current_user: recipient}
      invoice = invoice_simple.simple
    else
      invoices_simple = Simples::InvoicesSimple.new object: invoice,
        scope: {current_user: owner}
      invoice = invoices_simple.simple
    end
    options = {notification: {title: I18n.t("notifications.app_name"), text: text,
      click_action: click_action}, data: {notification_id: notification.id,
      click_action: click_action, invoice_id: invoice[:id], user: owner, invoice: invoice}}
    response = fcm.send registration_ids, options
  end
end
