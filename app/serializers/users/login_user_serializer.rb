class Users::LoginUserSerializer < UserSerializer
  attributes :authentication_token, :device_id, :registration_id

  ["authentication_token", "registration_id", "device_id"].each do |arg|
    define_method("#{arg}") do
      if scope && scope[:user_token]
        user_token = scope[:user_token]
        user_token.send("#{arg}")
      else
        nil
      end
    end
  end

end
