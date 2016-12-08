class UserSetting < ApplicationRecord
  belongs_to :user

  geocoded_by :current_location
  reverse_geocoded_by :latitude, :longitude, address: :current_location,
    if: :address_changed?

  after_validation :geocode, :reverse_geocode

  ATTRIBUTES_PARAMS = [:receive_notification, :favorite_location, :favorite_address,
    :favorite_latitude, :favorite_longitude, :radius_display, :user_id]
end
