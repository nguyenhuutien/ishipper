class Api::V1::Shipper::NotificationsController < Api::ShipperBaseController
  before_action :check_param_exist, :find_notification, only: :update

  def index
    user_setting = current_user.user_setting
    unread_notification = user_setting.unread_notification
    if params[:notification] && params[:notification][:page] &&
      params[:notification][:per_page]
      @notifications = current_user.passive_notifications.order_by_time.
        page(params[:notification][:page]).per params[:notification][:per_page]
      user_setting.update! unread_notification: 0
      render json: {message: I18n.t("notifications.messages.get_noti_success"),
        data: {notifications: @notifications, unread: unread_notification}, code: 1}, status: 200
    else
      render json: {message: I18n.t("notifications.messages.get_noti_success"),
        data: {notifications: [], unread: unread_notification}, code: 1}, status: 200
    end
  end

  def update
    if @notification.update_attributes notification_params
      channel_name = "#{current_user.phone_number}_realtime_channel"
      data = Hash.new
      data[:unread_notification] = current_user.user_setting.unread_notification
      RealtimeBroadcastJob.perform_now channel: channel_name,
        action: Settings.realtime.unread_notification, data: data
      render json: {message: I18n.t("notifications.update.success"),
        data:{}, code: 1}, status: 200
    else
      render json: {message: I18n.t("notifications.update.failed"), data: {},
        code: 0}, status: 200
    end
  end

  private
  def notification_params
    params.require(:notification).permit :read
  end

  def find_notification
    @notification = current_user.passive_notifications.find_by id: params[:id]
    if @notification.nil?
      render json: {message: I18n.t("notifications.messages.noti_not_exist"),
        data: {}, code: 0}, status: 200
    end
  end

  def check_param_exist
    if params[:notification].nil? || params[:notification][:read].nil?
      render json: {message: I18n.t("notifications.missing_params"), data: {},
        code: 0}, status: 422
    end
  end
end
