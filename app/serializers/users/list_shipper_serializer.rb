class Users::ListShipperSerializer < UserSerializer
  attributes :user_invoice_id, :favorite_user, :load_five_star, :load_four_star,
    :load_three_star, :load_two_star, :load_one_star, :sum_rate, :online,
    :number_finished_invoice, :number_all_invoice, :actions


  def user_invoice_id
    if scope && scope[:invoice]
      user_invoice = UserInvoice.find_by user_id: object.id, invoice: scope[:invoice],
        status: scope[:invoice].status
      user_invoice ? user_invoice.id : nil
    else
      nil
    end
  end

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

  def online
    object.online? if scope[:current_user]
  end

  def number_finished_invoice
    object.user_invoices.finished.size
  end

  def number_all_invoice
    object.user_invoices.reject{|invoice| invoice.rejected?}.size
  end

  def actions
    actions = Settings.shipper.actions.to_h
    if favorite_user == "favorite_user"
      actions.slice(:add_to_black_list, :remove_from_favorite_list)
    elsif favorite_user == "black_user"
      actions.slice(:remove_from_black_list)
    elsif favorite_user == "shipper"
      actions.slice(:add_to_favorite_list, :add_to_black_list)
    end
  end
end
