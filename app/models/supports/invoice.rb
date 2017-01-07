class Supports::Invoice
  def initialize args
    args.each do |key, value|
      instance_variable_set "@#{key}", value
    end
  end

  def list_receive_shippers
    @shippers = @invoice.received_shippers
    ActiveModelSerializers::SerializableResource.new(@shippers,
      each_serializer: Users::ListShipperSerializer, scope: {invoice: @invoice,
      current_user: @current_user})
  end

  def number_of_recipients
    @invoice.number_of_recipients
  end

  def status_histories
    @invoice.status_invoice_histories
  end

  def shipper
    unless @invoice.init?
      @user_invoice = @invoice.user_invoices.find_by status: @invoice.status
      if @user_invoice
        ActiveModelSerializers::SerializableResource.new(@user_invoice.user).as_json
      end
    end
  end
end
