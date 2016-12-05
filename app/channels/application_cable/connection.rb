module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      if request.headers["HTTP_PHONE_NUMBER"].nil? && request.headers["HTTP_AUTHORIZATION"].nil?
        self.current_user = find_verified_user_web
        logger.add_tags self.current_user.user.phone_number
      else
        phone_number = request.headers["HTTP_PHONE_NUMBER"]
        request.headers["HTTP_AUTHORIZATION"].slice! Settings.realtime.basic
        authorization = request.headers["HTTP_AUTHORIZATION"]
        self.current_user = find_verified_user phone_number, authorization
        logger.add_tags self.current_user.user.phone_number
      end
      if self.current_user.user.shipper?
        serializer = ActiveModelSerializers::SerializableResource.
          new(self.current_user.user, scope: {current_user: self.current_user.user}).as_json
        near_shops = User.near([self.current_user.user.latitude, self.current_user.user.longitude],
          Settings.max_distance).shop.users_online
        ShipperServices::RealtimeVisibilityShipperService.new(recipients: near_shops,
          shipper: serializer, action: Settings.realtime.shipper_online).perform
      end
    end

    protected
    def find_verified_user phone_number, authorization
      user = User.find_by phone_number: phone_number
      if user
        if user_tokens = user.user_tokens
          user_tokens.each do |user_token|
            if Base64.encode64(user_token.authentication_token).gsub("\n", "") == authorization
              user_token.update_attribute "online", true
              return user_token
            end
          end
          reject_unauthorized_connection
        end
      end
    end

    def find_verified_user_web
      if cookies[:user_token_id]
        if user_token = UserToken.find_by_id(cookies[:user_token_id])
          user_token.update_attribute "online", true
          user_token
        end
      else
        reject_unauthorized_connection
      end
    end
  end
end
