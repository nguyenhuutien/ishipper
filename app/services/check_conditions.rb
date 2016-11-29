class CheckConditions
  def initialize invoice, user_invoice, update_status
    @invoice = invoice
    @user_invoice = user_invoice
    @update_status = update_status
  end

  def check_status?
    @update_status.class.to_s == "String"
  end

  def check_current_status?
    if check_status?
      statuses = Invoice.statuses
      false unless statuses.has_key?(@invoice.status) || statuses.has_key?(@update_status)
      if "cancel" == @update_status && "finished" != @invoice.status &&
        "cancel" != @invoice.status
        true
      elsif "rejected" == @update_status && "init" == @invoice.status
        true
      elsif statuses[@update_status].pred == statuses[@invoice.status] &&
        "finished" != @invoice.status
        true
      else
        false
      end
    else
      true
    end
  end

  def check_user_invoice_present?
    @user_invoice.nil? && !@invoice.init?
  end

  def check_update_status_shipper?
    @update_status == "shipping" || @update_status == "shipped" ||
    @update_status == "cancel" || @update_status == "rejected"
  end

  def shipper_conditions?
    @user_invoice.nil? || @invoice.shipped? || @invoice.finished? || @invoice.cancel? ||
      !check_update_status_shipper? ||
      !check_current_status? ||
      @user_invoice.status != @invoice.status
  end

  def check_update_status_shop?
    @update_status == "finished" || @update_status == "cancel"
  end

  def shop_conditions? current_user
    @invoice.user != current_user || check_user_invoice_present? ||
      !check_update_status_shop? ||
      !check_current_status?
  end
end
