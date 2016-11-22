class UserInvoice < ApplicationRecord
  belongs_to :shipper, foreign_key: "user_id"
  belongs_to :invoice

  enum status: [:init, :waiting, :shipping, :shipped, :finished, :cancel, :rejected]

end
