class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_start, :latitude_start, :longitude_start,
    :address_finish, :latitude_finish, :longitude_finish, :delivery_time,
    :distance, :description, :price, :shipping_price, :status, :weight,
    :customer_name, :customer_number, :user

  def user
    if scope.shipper?
      object.user
    else
      if object.init?
        nil
      else
        status = object.status
        user_invoice = UserInvoice.find_by invoice_id: object.id, status: status
        user_invoice.user
      end
    end
  end
end
