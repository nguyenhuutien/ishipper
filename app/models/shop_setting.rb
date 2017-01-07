class ShopSetting < UserSetting
  include StiRouting
  belongs_to :shop
end
