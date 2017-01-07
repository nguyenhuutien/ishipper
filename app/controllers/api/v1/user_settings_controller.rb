class Api::V1::UserSettingsController < Api::BaseController
  include Authenticable
  include Confirm

  before_action :find_user_setting
  before_action :ensure_params_exist, only: :update
  after_action :update_location, only: :update

  def show
    render json: {message: I18n.t("user_setting.get.success"),
      data: {user_setting: @user_setting}, code: 1}, status: 200
  end

  def update
    if @user_setting.update_attributes user_setting_params
      render json: {message: I18n.t("user_setting.update.success"), data: {}, code: 1},
        status: 200
    else
      render json: {message: I18n.t("user_setting.update.fail"), data: {}, code: 1},
        status: 200
    end
  end

  private
  def user_setting_params
    params.require(:user_setting).permit UserSetting::ATTRIBUTES_PARAMS
  end

  def find_user_setting
    @user_setting = current_user.user_setting
  end

  def update_location
    if current_user.shipper?
      user_simple = Simples::UsersSimple.new object: current_user
      shipper = user_simple.simple
      shop_settings = ShopSetting.near [@user_setting.latitude,
        @user_setting.longitude], Settings.max_distance, order: false
      near_shops = Shop.users_by_user_setting(shop_settings).users_online
      realtime_visibility_shipper = ShipperServices::RealtimeVisibilityShipperService.
        new recipients: near_shops.includes(:user_setting), shipper: shipper,
        action: Settings.realtime.shipper_online
      realtime_visibility_shipper.perform
    end
  end
end
