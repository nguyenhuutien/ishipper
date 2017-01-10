class Supports::Shipper::Shippers < Supports::User
  def shippers
    @shippers ||= list_shippers
  end

  def base_shippers
    @base_shippers ||= base_list_shippers
  end

  private
  def shippers_near_by
    @shipper_settings ||= ShipperSetting.near([user_setting.latitude,
      user_setting.longitude], Settings.max_distance, order: false).includes :shipper
  end

  def shipper_settings
    if @users
      @users.includes(:user_invoices, shipper_setting: [:shipper]).collect do |shipper|
        shipper.shipper_setting
      end
    else
      shippers_near_by
    end
  end

  def base_list_shippers
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

  def list_shippers
    shipper_settings.collect do |shipper_setting|
      shipper = Supports::Shipper::Shipper.new current_user: @current_user,
        shipper: shipper_setting.shipper
      Hash[:id, shipper_setting.shipper.id,
        :name, shipper_setting.shipper.name,
        :email, shipper_setting.shipper.email,
        :address, shipper_setting.shipper.address,
        :current_location, shipper_setting.current_location,
        :latitude, shipper_setting.latitude,
        :longitude, shipper_setting.longitude,
        :phone_number, shipper_setting.shipper.phone_number,
        :plate_number, shipper_setting.shipper.plate_number,
        :rate, shipper_setting.shipper.rate,
        :actions, shipper.actions,
        :favorite_user, shipper.favorite_user,
        :number_finished_invoice, shipper.number_finished_invoice,
        :number_all_invoice, shipper.number_all_invoice
      ]
    end
  end
end
