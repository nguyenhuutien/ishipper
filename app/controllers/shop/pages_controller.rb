class Shop::PagesController < Shop::ShopBaseController
  def index
    shipper_settings = ShipperSetting.near([current_user.user_setting.latitude,
      current_user.user_setting.longitude], Settings.max_distance, order: false).
      includes :shipper
    @shippers = Shipper.users_by_user_setting shipper_settings
    @support = Supports::User.new current_user: current_user,
      users: @shippers.includes(:user_setting)
  end
end
