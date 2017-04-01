class ShopSetting < UserSetting
  include StiRouting
  belongs_to :shop, foreign_key: :user_id
end
