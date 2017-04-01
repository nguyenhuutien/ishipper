class ShipperSetting < UserSetting
  include StiRouting
  belongs_to :shipper, foreign_key: :user_id
end
