class UserInvoiceHistory < ApplicationRecord
  belongs_to :user_invoice

  enum status: [:init, :waiting, :shipping, :shipped, :finished, :cancel, :rejected]
end
