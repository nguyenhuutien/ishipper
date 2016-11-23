# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RealtimeChannel < ApplicationCable::Channel
  def subscribed
    channel_name = "#{self.current_user.phone_number}_realtime_channel"
    stream_from channel_name
    data = Hash.new
    data[:unread_notification] = self.current_user.user_setting.unread_notification
    RealtimeBroadcastJob.perform_now channel: channel_name,
      action: Settings.realtime.unread_notification, data: data
  end

  def unsubscribed
    self.current_user.update_attribute "online", false
    # Any cleanup needed when channel is unsubscribed
  end
end
