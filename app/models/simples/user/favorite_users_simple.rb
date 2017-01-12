class Simples::User::FavoriteUsersSimple < Simples::UsersSimple
  attr_accessor :favorite_list_id

  def favorite_list_id
    if @current_user
      temp = @current_user.owner_favorite_lists.find_by_favorite_list_user_id @object.id
      temp ? temp.id : 0
    else
      0
    end
  end
end
