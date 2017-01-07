class Shop::PagesController < Shop::ShopBaseController
  def index
    @support = Supports::Shipper::Shippers.new current_user: current_user, params: nil
  end
end
