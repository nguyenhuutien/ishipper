class UserInvoice < ApplicationRecord
  belongs_to :shipper, foreign_key: "user_id"
  belongs_to :invoice
  belongs_to :user

  enum status: [:init, :waiting, :shipping, :shipped, :finished, :cancel, :rejected]
end
