class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :current_location, :latitude,
    :longitude, :phone_number, :plate_number, :role, :rate

  def current_location
    object.user_setting.current_location
  end

  def latitude
    object.user_setting.latitude
  end

  def longitude
    object.user_setting.longitude
  end
end
