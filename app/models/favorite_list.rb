class FavoriteList < ApplicationRecord
  belongs_to :owner, class_name: User.name
  belongs_to :favorite_list_user, class_name: User.name

  FAVORITE_LIST_ATTRIBUTES_PARAMS = [:favorite_list_user_id]
end
