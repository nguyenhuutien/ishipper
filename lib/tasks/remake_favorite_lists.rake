namespace :db do
  desc "Import favorite_lists"
  task favorite_lists: [:environment] do
    shops = Shop.all
    shippers = Shipper.where id: 3..4
    favorites = []
    shippers.each do |shipper|
      shops.each do |shop|
        favorites << FavoriteList.new(owner_id: shipper.id, favorite_list_user_id: shop.id)
      end
    end
    FavoriteList.import favorites
  end
end
