class Supports::Invoice
  attr_reader :invoice

  def initialize args
    @invoice = args[:invoice]
    @current_user = args[:current_user]
  end

  def list_receive_shippers
    @shippers = @invoice.all_shipper
    @shippers = @shippers - @current_user.black_list_users
    ActiveModelSerializers::SerializableResource.new(@shippers,
      each_serializer: Users::ListShipperSerializer, scope: {invoice: @invoice,
      current_user: @current_user})
  end

  def number_of_recipients
    @shippers = @invoice.all_shipper
    @shippers = @shippers - @current_user.black_list_users
    @shippers.size
  end

  def status_histories
    @invoice.status_invoice_histories
  end

  def shipper
    @user_invoice = @invoice.user_invoices.find_by status: @invoice.status
    if @user_invoice
      ActiveModelSerializers::SerializableResource.new(@user_invoice.user).as_json
    end
  end
end
