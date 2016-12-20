namespace :db do
  desc "Import favorite_lists"
  task favorite_lists: [:environment] do
    @shops = User.where role: "shop"

    (3..4).each do |shipper_id|
      @shops.each do |shop|
        FavoriteList.create! owner_id: shipper_id, favorite_list_user_id: shop.id
      end
    end
  end
end
