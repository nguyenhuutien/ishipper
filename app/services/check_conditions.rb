class CheckConditions
  def initialize invoice, user_invoice, update_status
    @invoice = invoice
    @user_invoice = user_invoice
    @update_status = update_status
  end

  def check_current_status
    statuses = Invoice.statuses
    false unless statuses.has_key?(@invoice.status) || statuses.has_key?(@update_status)
    if "cancel" == @update_status && "finished" != @invoice.status &&
      "cancel" != @invoice.status
      true
    elsif statuses[@update_status].pred == statuses[@invoice.status] &&
      "finished" != @invoice.status
      true
    else
      false
    end
  end

  def check_update_status_shipper?
    @update_status == "shipping" || @update_status == "shipped" ||
    @update_status == "cancel"
  end

  def shipper_conditions?
    @user_invoice.nil? || @invoice.init? || @invoice.shipped? ||
      !check_current_status ||
      !check_update_status_shipper? ||
      @user_invoice.status != @invoice.status
  end

  def check_update_status_shop?
    @update_status == "finished" || @update_status == "cancel"
  end

  def shop_conditions? current_user
    @invoice.user != current_user || @user_invoice.nil? ||
      !check_current_status ||
      !check_update_status_shop? ||
      (@update_status == "cancel" && @invoice.shipped?)
  end
end
