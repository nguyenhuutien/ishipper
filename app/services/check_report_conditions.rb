class CheckReportConditions

  def initialize invoice, user_invoice, review_type, current_user
    @invoice = invoice
    @user_invoice = user_invoice
    @review_type = review_type
    @current_user = current_user
  end

  def check_report_type?
    @review_type != "report"
  end

  def shipper_check_invoice_status?
    @invoice.init? || @invoice.shipping? || @invoice.shipped? || @invoice.finished?
  end

  def check_correct_shipper?
    @user_invoice.nil? || @current_user != @user_invoice.user
  end

  def shop_check_invoice_status?
    @invoice.init? || @invoice.shipped? || @invoice.finished?
  end

  def shipper_report_conditions?
    check_report_type? ||
    shipper_check_invoice_status? ||
    check_correct_shipper?
  end

  def shop_report_conditions?
    check_report_type? || shop_check_invoice_status?
  end
end
