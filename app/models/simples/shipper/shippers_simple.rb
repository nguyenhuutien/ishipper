class Simples::Shipper::ShippersSimple < Simples::Shipper::ShipperSimple
  def simple
    superclass = @object.class.superclass
    if superclass == ActiveRecord::Relation || superclass.superclass == ActiveRecord::Relation
      simples = Array.new
      @object.includes(:user_invoices, :user_setting).each do |object|
        shipperSimple = Simples::Shipper::ShipperSimple.new object: object,
          scope: {current_user: @current_user, invoice: @invoice}
        simples << shipperSimple.simple
      end
      simples
    else
      shipperSimple = Simples::Shipper::ShipperSimple.new object: @object,
        scope: {current_user: @current_user, invoice: @invoice}
      shipperSimple.simple
    end
  end
end
