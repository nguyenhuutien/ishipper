namespace :db do
  desc "Import favorite_lists"
  task favorite_lists: [:environment] do
    @shippers = User.where role: "shipper"
    @shops = User.where role: "shop"

    @shippers.each do |shipper|
      @shops.each do |shop|
        FavoriteList.create! owner_id: shipper.id, favorite_list_user_id: shop.id
      end
    end
  end
end
