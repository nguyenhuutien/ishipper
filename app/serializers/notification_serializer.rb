class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :recipient_id, :status, :user_invoice_id,
    :click_action, :read, :invoice, :content

  def content
    I18n.t("notifications.#{object.status}", user_name: object.owner.name,
      invoice_name: object.invoice.name)
  end
end
