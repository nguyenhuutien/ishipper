class Simples::Shipper::ShippersSimple < Simples::Shipper::ShipperSimple
  def simple
    simples = Array.new
    @object.includes(:user_invoices, :user_setting).each do |object|
      shipperSimple = Simples::Shipper::ShipperSimple.new object: object,
        scope: {current_user: @current_user, invoice: @invoice}
      simples << shipperSimple.simple
    end
    simples
  end
end
