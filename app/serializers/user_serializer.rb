class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :current_location, :latitude,
    :longitude, :phone_number, :plate_number, :role, :rate

# khong nho la su dung khi nao
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
