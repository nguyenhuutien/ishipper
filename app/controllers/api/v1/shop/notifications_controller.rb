class Api::V1::Shop::NotificationsController < Api::ShopBaseController
  before_action :check_param_exist, :find_notification, only: :update

  def update
    if @notification.update_attributes notification_params
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
        data: {}, code: 0}, status: 422
    end
  end

  def check_param_exist
    if params[:notification].nil? || params[:notification][:read].nil?
      render json: {message: I18n.t("notifications.missing_params"), data: {},
        code: 0}, status: 422
    end
  end
end
