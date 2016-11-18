class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :current_location, :latitude,
    :longitude, :phone_number, :plate_number, :role, :rate, :user_invoice_id,
    :black_list_id, :favorite_list_id, :favorite_user, :authentication_token,
    :device_id, :registration_id, :load_five_star, :load_four_star, :load_three_star,
    :load_two_star, :load_one_star, :sum_rate

  def user_invoice_id
    current_user = object
    if scope && current_user && (invoice = Invoice.find_by_id scope[:invoice_id])
      user_invoice = UserInvoice.find_by user_id: current_user.id, invoice_id: invoice.id
      user_invoice ? user_invoice.id : nil
    else
      nil
    end
  end

  ["black", "favorite"].each do |arg|
    define_method("#{arg}_list_id") do
      if scope && (current_user = scope[:current_user])
        if temp = current_user.send("owner_#{arg}_lists").
          send("find_by_#{arg}_list_user_id", object.id)
          temp.id
        else
          nil
        end
      else
        nil
      end
    end
  end

  def favorite_user
    if scope && (current_user = scope[:current_user])
      current_user.owner_favorite_lists.find_by(favorite_list_user_id: object.id).present?
    else
      false
    end
  end

  ["authentication_token", "registration_id", "device_id"].each do |arg|
    define_method("#{arg}") do
      if scope && scope[:authentication] && scope[:user_token]
        user_token = scope[:user_token]
        user_token.send("#{arg}")
      else
        nil
      end
    end
  end

  def supports
    Supports::User.new scope[:current_user]
  end

  Settings.rate.list_rate.each do |rate|
    define_method rate do
      supports.send(rate) if supports
    end
  end

  def sum_rate
    supports.sum_rate
  end
end
