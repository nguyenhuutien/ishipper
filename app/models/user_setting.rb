class UserSetting < ApplicationRecord
  belongs_to :user

  ATTRIBUTES_PARAMS = [:receive_notification, :favorite_location, :favorite_address,
    :favorite_latitude, :favorite_longitude, :radius_display, :user_id]
end
