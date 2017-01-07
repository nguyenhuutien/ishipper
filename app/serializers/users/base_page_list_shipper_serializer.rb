class Users::BasePageListShipperSerializer < UserSerializer
  attributes :favorite_user, :online

  def favorite_user
    if scope && (current_user = scope[:current_user])
      if current_user.owner_favorite_lists.find_by(favorite_list_user_id: object.id).present?
        "favorite_user"
      elsif current_user.owner_black_lists.find_by(black_list_user_id: object.id).present?
        "black_user"
      else
        "shipper"
      end
    end
  end

  def online
    object.online? if scope[:current_user]
  end
end
