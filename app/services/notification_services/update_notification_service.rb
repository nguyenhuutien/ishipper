class NotificationServices::UpdateNotificationService
  attr_reader :args

  def initialize args
    @current_user = args[:current_user]
    @notification_id = args[:notification_id]
  end

  def perform
    channel_name = "#{@current_user.phone_number}_realtime_channel"
    @current_user.user_setting.update_attributes unread_notification: 0
    data = Hash.new
    data[:unread_notification] = 0
    RealtimeBroadcastJob.perform_now channel: channel_name,
      action: Settings.realtime.unread_notification, data: data
    if @notification_id && notification = @current_user.passive_notifications.
      find_by(id: @notification_id)
      notification.update_attributes read: true
    end
  end
end
