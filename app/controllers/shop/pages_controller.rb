class Shop::PagesController < Shop::ShopBaseController
  def index
    @support = Supports::User.new current_user: current_user, params: nil
    if current_user
      @notifications = current_user.passive_notifications.order_by_time.
        page(params[:page]).per Settings.notifications_per_request
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
