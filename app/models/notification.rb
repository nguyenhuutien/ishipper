class Notification < ApplicationRecord
  belongs_to :owner, class_name: User.name
  belongs_to :recipient, class_name: User.name
  belongs_to :invoice

  enum status: [:receive, :waiting, :shipping, :shipped, :finished, :cancel, :favorite]

  scope :order_by_time, -> {order created_at: :desc}
end
