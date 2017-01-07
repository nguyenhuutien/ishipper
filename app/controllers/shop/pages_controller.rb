class Shop::PagesController < Shop::ShopBaseController
  def index
    @support = Supports::User.new current_user: current_user, params: nil
  end
end
