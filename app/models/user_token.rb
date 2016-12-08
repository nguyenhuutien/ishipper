class UserToken < ApplicationRecord
  belongs_to :user
  has_one :user_setting, through: :user, source: :user_setting

  ATTRIBUTES_PARAMS = [:authentication_token, :device_id, :registration_id]
end
