class Review < ApplicationRecord
  belongs_to :owner, class_name: User.name
  belongs_to :recipient, class_name: User.name
  belongs_to :invoice

  enum review_type: [:rate, :report]

  RATE_ATTRIBUTES_PARAMS = [:review_type, :rating_point, :content]
  REPORT_ATTRIBUTES_PARAMS = [:review_type, :content]
end
