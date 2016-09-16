class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :current_location, :latitude,
    :longitude, :phone_number, :plate_number, :role, :rate, :user_invoice_id,
    :black_list_id, :favorite_list_id

  def user_invoice_id
    invoice = Invoice.find_by_id scope[:invoice_id] if scope
    current_user = object
    if current_user && invoice
      user_invoice = UserInvoice.find_by user_id: current_user.id, invoice_id: invoice.id
      user_invoice ? user_invoice.id : nil
    else
      nil
    end
  end

  def black_list_id
    current_user = scope[:current_user] if scope
    if current_user
      black_list_id = current_user.owner_black_lists.find_by black_list_user_id: object.id
      black_list_id ? black_list_id.id : nil
    else
      nil
    end
  end

  def favorite_list_id
    current_user = scope[:current_user] if scope
    if current_user
      favorite_list_id = current_user.owner_favorite_lists.find_by favorite_list_user_id: object.id
      favorite_list_id ? favorite_list_id.id : nil
    else
      nil
    end
  end
end
