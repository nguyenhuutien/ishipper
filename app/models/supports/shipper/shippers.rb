class Supports::Shipper::Shippers < Supports::User
  def shippers
    @shippers ||= list_shippers
  end

  private
  def list_shippers
    shipper_settings = ShipperSetting.near([user_setting.latitude,
      user_setting.longitude], Settings.max_distance, order: false).includes :shipper
    shipper_settings.collect do |shipper_setting|
      Hash[:id, shipper_setting.shipper.id,
        :name, shipper_setting.shipper.name,
        :email, shipper_setting.shipper.email,
        :address, shipper_setting.shipper.address,
        :current_location, shipper_setting.current_location,
        :latitude, shipper_setting.latitude,
        :longitude, shipper_setting.longitude,
        :phone_number, shipper_setting.shipper.phone_number,
        :plate_number, shipper_setting.shipper.plate_number,
        :rate, shipper_setting.shipper.rate
      ]
    end.to_json
  end
end
