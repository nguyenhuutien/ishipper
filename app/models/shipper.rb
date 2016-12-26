class Shipper < User
  include StiRouting

  has_many :user_invoices, foreign_key: "user_id", dependent: :destroy
  has_many :invoices, through: :user_invoices, source: :invoice
end
