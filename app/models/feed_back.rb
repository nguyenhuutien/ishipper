class FeedBack < ApplicationRecord
  validates :message, presence: true
end
