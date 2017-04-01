module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      if request.headers["HTTP_AUTHORIZATION"].nil?
        self.current_user = find_verified_user_web
      else
        self.current_user = find_verified_user request.headers["HTTP_AUTHORIZATION"]
      end
      logger.add_tags self.current_user.user.phone_number
      if self.current_user.user.shipper?
        users_simple = Simples::UsersSimple.new object: self.current_user.user
        user = users_simple.simple
        shop_settings = ShopSetting.near [self.current_user.user_setting.latitude,
          self.current_user.user_setting.longitude], Settings.max_distance, order: false
        near_shops = Shop.users_by_user_setting(shop_settings).includes :user_tokens
        near_shops = near_shops.users_online
        ShipperServices::RealtimeVisibilityShipperService.new(recipients: near_shops,
          shipper: user, action: Settings.realtime.shipper_online).perform
      end
    end

    protected

    def find_verified_user authorization
      if user_token = UserToken.find_by(authentication_token: authorization)
        user_token.update_attribute "online", true unless user_token.user.online?
        user_token
      else
        reject_unauthorized_connection
      end
    end

    def find_verified_user_web
      if cookies[:user_token_id] && user_token = UserToken.find_by_id(cookies[:user_token_id])
        user_token.update_attribute "online", true unless user_token.user.online?
        user_token
      else
        reject_unauthorized_connection
      end
    end
  end
end
