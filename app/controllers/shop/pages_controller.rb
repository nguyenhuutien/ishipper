class Shop::PagesController < Shop::ShopBaseController
  def index
    @shippers = UserSetting.near [current_user.user_setting.latitude,
      current_user.user_setting.longitude], Settings.max_distance, order: false
    @shippers = User.users_by_user_setting(@shippers).shipper
    @shippers = ActiveModelSerializers::SerializableResource.new @shippers,
      each_serializer: Users::ListShipperSerializer, scope: {current_user: current_user}
  end
end
