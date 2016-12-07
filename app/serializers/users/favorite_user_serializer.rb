class Users::FavoriteUserSerializer < UserSerializer
  attributes :black_list_id, :favorite_list_id

  ["black", "favorite"].each do |arg|
    define_method("#{arg}_list_id") do
      if scope && (current_user = scope[:current_user])
        if temp = current_user.send("owner_#{arg}_lists").
          send("find_by_#{arg}_list_user_id", object.id)
          temp.id
        else
          nil
        end
      else
        nil
      end
    end
  end
end
