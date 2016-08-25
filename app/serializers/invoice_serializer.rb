class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_start, :latitude_start, :longitude_start,
    :address_finish, :latitude_finish, :longitude_finish, :delivery_time,
    :distance, :description, :price, :shipping_price, :status, :weight,
    :customer_name, :customer_number

  belongs_to :user

end
