class Simples::Shipper::ShipperSimple < Simples::UserSimple
  attr_accessor :plate_number, :favorite_user, :actions, :number_finished_invoice,
    :number_all_invoice, :user_invoice_id

  def favorite_user
    @favorite_user ||= if @current_user.owner_favorite_lists.
      find_by(favorite_list_user_id: @object.id).present?
      "favorite_user"
    elsif @current_user.owner_black_lists.find_by(black_list_user_id: @object.id).present?
      "black_user"
    else
      "shipper"
    end
  end

  def actions
    actions = Settings.shipper.actions.to_h
    if favorite_user == "favorite_user"
      actions.slice :add_to_black_list, :remove_from_favorite_list
    elsif favorite_user == "black_user"
      actions.slice :remove_from_black_list
    elsif favorite_user == "shipper"
      actions.slice :add_to_favorite_list, :add_to_black_list
    end
  end

  def number_finished_invoice
    @object.user_invoices.finished.size
  end

  def number_all_invoice
    @object.user_invoices.reject{|invoice| invoice.rejected?}.size
  end

  def user_invoice_id
    user_invoice = @object.user_invoices.find{|user_invoice|
      user_invoice.invoice_id == @invoice.id} if @invoice
    if user_invoice
      user_invoice.id
    else
      0
    end
  end
end
