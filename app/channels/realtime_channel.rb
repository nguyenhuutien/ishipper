# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RealtimeChannel < ApplicationCable::Channel
  def subscribed
    user_token = UserToken.find_by authentication_token: params["authentication_token"]
    if user_token
      channel_name = "#{user_token.user.phone_number}_realtime_channel"
      stream_from channel_name
      data = Hash.new
      data[:unread_notification] = user_token.user.user_setting.unread_notification
      RealtimeBroadcastJob.perform_now channel: channel_name,
        action: Settings.realtime.unread_notification, data: data
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
