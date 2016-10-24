class UserToken < ApplicationRecord
  belongs_to :user

  ATTRIBUTES_PARAMS = [:authentication_token, :device_id, :registration_id]
end
