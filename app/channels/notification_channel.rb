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
      NotificationServices::UpdateNotificationService.new(current_user: self.current_user.user,
        notification_id: data["notification_id"].to_i).perform
    end
  end
end
