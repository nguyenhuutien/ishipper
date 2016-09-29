class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_start, :latitude_start, :longitude_start,
    :address_finish, :latitude_finish, :longitude_finish, :delivery_time,
    :distance_invoice, :description, :price, :shipping_price, :status, :weight,
    :customer_name, :customer_number, :user, :received

  def user
    if scope && scope.shipper?
      object.user
    else
      if object.init?
        nil
      else
        status = object.status
        user_invoice = UserInvoice.find_by invoice_id: object.id, status: status
        if user_invoice
          user_invoice.user
        else
          nil
        end
      end
    end
  end

  def received
    if scope && scope.shipper?
      user_invoice = UserInvoice.find_by invoice_id: object.id, user: scope
      if user_invoice
        true
      else
        false
      end
    else
      false
    end
  end
end
