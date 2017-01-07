class ShipperSetting < UserSetting
  include StiRouting
  belongs_to :shipper
end
