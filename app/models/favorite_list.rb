class FavoriteList < ApplicationRecord
  belongs_to :owner, class_name: User.name
  belongs_to :favorite_list_user, class_name: User.name
end
