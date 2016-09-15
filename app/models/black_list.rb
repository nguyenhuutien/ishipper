class BlackList < ApplicationRecord
  belongs_to :user

  BLACK_LIST_ATTRIBUTES_PARAMS = [:black_list_user_id]
end
