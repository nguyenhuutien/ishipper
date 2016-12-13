class Users::ListShipperSerializer < UserSerializer
  attributes :user_invoice_id, :favorite_user, :load_five_star, :load_four_star, :load_three_star,
    :load_two_star, :load_one_star, :sum_rate

  def user_invoice_id
    if scope && scope[:invoice]
      user_invoice = UserInvoice.find_by user_id: object.id, invoice: scope[:invoice]
      user_invoice ? user_invoice.id : nil
    else
      nil
    end
  end

  def favorite_user
    if scope && (current_user = scope[:current_user])
      current_user.owner_favorite_lists.find_by(favorite_list_user_id: object.id).present?
    else
      false
    end
  end

  def supports
    Supports::User.new current_user: scope[:current_user]
  end

  Settings.rate.list_rate.each do |rate|
    define_method rate do
      supports.send(rate) if supports
    end
  end

  def sum_rate
    supports.sum_rate
  end
end
