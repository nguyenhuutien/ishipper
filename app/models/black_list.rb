class BlackList < ApplicationRecord
  belongs_to :owner, class_name: User.name
  belongs_to :black_list_user, class_name: User.name
end
