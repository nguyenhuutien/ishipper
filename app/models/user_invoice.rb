class UserInvoice < ApplicationRecord
  belongs_to :shipper, foreign_key: "user_id"
  belongs_to :invoice
  belongs_to :user

  has_many :user_invoice_histories

  enum status: [:init, :waiting, :shipping, :shipped, :finished, :cancel, :rejected]
end
