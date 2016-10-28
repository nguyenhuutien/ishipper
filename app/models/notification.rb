class Notification < ApplicationRecord
  belongs_to :owner, class_name: User.name
  belongs_to :recipient, class_name: User.name

  enum content: [:receive, :waiting, :shipping, :shipped, :finished, :cancel]

  scope :unread, -> {where read: false}
end
