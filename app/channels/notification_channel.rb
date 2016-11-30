class NotificationChannel < ApplicationCable::Channel
  def subscribed
    channel_name = "#{self.current_user.user.phone_number}_notification_channel"
    stream_from channel_name
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak data
    if data["action_type"] == "unread_notification"
      current_user.user.user_setting.update_attributes unread_notification: 0
      if data["notification_id"].present?
        current_user.user.passive_notifications.find_by(id: data["notification_id"].to_i).
          update_attributes read: true
      end
    end
  end
end
