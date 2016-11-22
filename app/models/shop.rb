class Shop < User
  include StiRouting

  has_many :invoices, foreign_key: "user_id", dependent: :destroy
end
