module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      if request.headers["HTTP_PHONE_NUMBER"] && request.headers["HTTP_AUTHORIZATION"]
        phone_number = request.headers["HTTP_PHONE_NUMBER"]
        request.headers["HTTP_AUTHORIZATION"].slice! Settings.realtime.basic
        authorization = request.headers["HTTP_AUTHORIZATION"]
        self.current_user = find_verified_user phone_number, authorization
        self.current_user.update_attribute "online", true
        logger.add_tags self.current_user.phone_number
      else
        reject_unauthorized_connection
      end
    end

    protected
    def find_verified_user phone_number, authorization
      user = User.find_by phone_number: phone_number
      if user
        if user_tokens = user.user_tokens
          user_tokens.each do |user_token|
            if Base64.encode64(user_token.authentication_token).gsub("\n", "") == authorization
              return user
            end
          end
          reject_unauthorized_connection
        end
      end
    end
  end
end
