class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :current_location, :latitude,
    :longitude, :phone_number, :plate_number, :role, :rate, :user_invoice_id,
    :black_list_id, :favorite_list_id, :favorite_user

  def user_invoice_id
    invoice = Invoice.find_by_id scope[:invoice_id]
    current_user = object
    if scope && current_user && invoice
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
end
