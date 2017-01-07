class UserSetting < ApplicationRecord
  belongs_to :user

  geocoded_by :current_location
  reverse_geocoded_by :latitude, :longitude, address: :current_location


  after_validation :geocode, if: :current_location_changed?
  after_validation  :reverse_geocode
  ATTRIBUTES_PARAMS = [:receive_notification, :favorite_location, :favorite_address,
    :favorite_latitude, :favorite_longitude, :latitude, :longitude,
    :radius_display, :user_id]

  self.inheritance_column = :_type_disabled
  self.inheritance_column = :role
end
