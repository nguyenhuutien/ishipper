class ConditionReportServices::ShipperConditionService
  attr_reader :args

  def initialize args
    @invoice = args[:invoice]
    @user_invoice = args[:user_invoice]
    @review_type = args[:review_type]
    @current_user = args[:current_user]
  end

  def perform?
    check_params? && check_type_report? && check_shippper_invoice_status? && check_correct_shipper?
  end

  private
  def check_params?
    @invoice.present? && @user_invoice.present? && @review_type.present? && @current_user.present?
  end

  def check_type_report?
    @review_type == "report"
  end

  def check_shippper_invoice_status?
    @invoice.cancel?
  end

  def check_correct_shipper?
    @user_invoice.user == @current_user
  end
end
