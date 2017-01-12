class Simples::InvoiceSimple < Simples::BaseSimple
  attr_accessor :id, :name, :address_start, :latitude_start, :longitude_start,
    :address_finish, :latitude_finish, :longitude_finish, :delivery_time, :distance_invoice,
    :description, :price, :shipping_price, :status, :weight, :user_invoice_id,
    :user, :status_histories

  def user_invoice_id
    shippers_simple = Simples::Shipper::ShippersSimple.new object: @current_user,
      scope: {invoice: @object}
    shippers_simple.instance_variable_get "@user_invoice_id"
  end

  def user
    users_simple = Simples::UsersSimple.new object: @object.shop
    users_simple.simple
  end

  def status_histories
    if @object.init?
      nil
    else
      status_history = Simples::StatusInvoiceHistoriesSimple.
        new object: @object.status_invoice_histories
      status_history.simple
    end
  end
end
