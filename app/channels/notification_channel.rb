class NotificationChannel < ApplicationCable::Channel
  def subscribed
    channel_name = "#{self.current_user.user.phone_number}_notification_channel"
    stream_from channel_name
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
