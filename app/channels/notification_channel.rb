class NotificationChannel < ApplicationCable::Channel
  def subscribed
    channel_name = "#{self.current_user.user.phone_number}_notification_channel"
    stream_from channel_name
  end

  def unsubscribed
  end

  def speak data
    self.current_user.user.reload
    if data["action_type"] == "unread_notification" && data["notification_id"].present?
      notification = self.current_user.user.passive_notifications.find_by_id data["notification_id"].to_i
      unread_notification = self.current_user.user.user_setting.unread_notification
      unread_notification = unread_notification - 1 if unread_notification > 0
      NotificationServices::UpdateNotificationService.new(current_user: self.current_user.user,
        notification: notification, unread_notification: unread_notification).perform
    else
      NotificationServices::UpdateNotificationService.new(current_user: self.current_user.user,
        notification: nil, unread_notification: 0).perform
    end
  end
end
