class Shop::ShippersController < Shop::ShopBaseController

  def index
    @shippers = if params[:type]
      current_user.send params[:type]
    else
      current_user.list_shipper_received
    end
    @q = params[:q]
    @shippers = @shippers.search_shipper(@q) if @q
    shippers_simple = Simples::Shipper::ShippersSimple.new object: @shippers,
      scope: {current_user: current_user}
    @shippers = shippers_simple.simple
    @current_type = params[:type].present? ? params[:type] : Settings.shipper.types.list_shipper_received
  end

  def update
    if params[:action_type] && current_user.send("#{params[:action_type]}", "#{params[:id]}")
      @shippers = current_user.send params[:current_type]
      @shippers = Simples::Shipper::ShippersSimple.new(object: @shippers,
        scope: {current_user: current_user}).simple
      @current_type = params[:current_type]
    end
  end
end

