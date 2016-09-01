class CheckRateConditions
  def initialize invoice, user_invoice, review_type, current_user
    @invoice = invoice
    @user_invoice = user_invoice
    @review_type = review_type
    @current_user = current_user
  end

  def check_review_type?
    @review_type != "rate"
  end

  def check_ship_invoice_status?
    @invoice.init? || @invoice.waiting? || @invoice.shipping? || @invoice.cancel?
  end

  def check_shop_invoice_status?
    @invoice.init? || @invoice.waiting? || @invoice.shipping? ||
      @invoice.cancel? || @invoice.shipped?
  end

  def check_correct_shipper?
    @user_invoice.user != @current_user
  end

  def ship_check_rate?
    check_review_type? || check_ship_invoice_status? || check_correct_shipper?
  end

  def shop_check_rate?
    check_review_type? || check_shop_invoice_status?
  end
end
