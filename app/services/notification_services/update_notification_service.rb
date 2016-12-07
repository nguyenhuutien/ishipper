class NotificationServices::UpdateNotificationService
  attr_reader :args

  def initialize args
    @current_user = args[:current_user]
    @notification = args[:notification]
    @unread_notification = args[:unread_notification]
  end

  def perform
    channel_name = "#{@current_user.phone_number}_realtime_channel"
    @current_user.user_setting.update_attributes unread_notification: @unread_notification
    data = Hash.new
    data[:unread_notification] = @unread_notification
    RealtimeBroadcastJob.perform_now channel: channel_name,
      action: Settings.realtime.unread_notification, data: data
    @notification.update_attributes read: true if @notification
  end
end
