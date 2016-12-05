class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_start, :latitude_start, :longitude_start,
    :address_finish, :latitude_finish, :longitude_finish, :delivery_time,
    :distance_invoice, :description, :price, :shipping_price, :status, :weight

  def condition?
    if object.init?
      false
    else
      true
    end
  end
end
