class Shipper < User
  include StiRouting

  has_many :user_invoices, foreign_key: "user_id", dependent: :destroy
end
