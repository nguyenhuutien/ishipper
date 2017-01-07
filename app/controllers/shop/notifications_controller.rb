class Shop::NotificationsController < Shop::ShopBaseController
  def index
    @notifications = current_user.passive_notifications.order_by_time.
      includes(:owner, :invoice).page(params[:page]).per Settings.notifications_per_request
    respond_to do |format|
      format.html
      format.js
    end
  end
end
