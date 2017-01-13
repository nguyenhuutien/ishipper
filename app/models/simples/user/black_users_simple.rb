class Simples::User::BlackUsersSimple < Simples::UsersSimple
  attr_accessor :black_list_id

  def black_list_id
    if @current_user
      temp = @current_user.owner_black_lists.find_by_black_list_user_id @object.id
      temp ? temp.id : 0
    else
      0
    end
  end
end
