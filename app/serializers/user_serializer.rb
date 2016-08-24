class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :current_location, :latitude,
    :longitude, :phone_number, :plate_number, :role, :rate
end
