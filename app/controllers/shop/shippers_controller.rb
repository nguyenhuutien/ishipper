class Shop::ShippersController < Shop::ShopBaseController

  def index
    @shippers = if params[:type]
      current_user.send params[:type]
    else
      current_user.list_shipper_received
    end
    @shippers = @shippers.search_user "Shipper", params[:name_shipper] if @shippers && params[:name_shipper]
  end
end
