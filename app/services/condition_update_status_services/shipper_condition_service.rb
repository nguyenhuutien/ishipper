class ConditionUpdateStatusServices::ShipperConditionService
  attr_reader :args

  def initialize args
    @invoice = args[:invoice]
    @user_invoice = args[:user_invoice]
    @update_status = args[:update_status]
    @current_user = args[:current_user]
  end

  def perform?
    check_params? && check_current_status?
  end

  private
  def check_params?
    @invoice.present? && @user_invoice.present? && @update_status.present? && @current_user.present?
  end

  def check_type_status?
    @update_status.class == String
  end

  def check_current_status?
    if check_type_status?
      statuses = Invoice.statuses
      if statuses.has_key?(@invoice.status) && statuses.has_key?(@update_status)
        if "waiting" == @invoice.status && "shipping" == @update_status
          true
        elsif "shipping" == @invoice.status && "shipped" == @update_status
          true
        elsif ["waiting", "shipping"].include?(@invoice.status) &&
          "cancel" == @update_status
          true
        end
      else
        false
      end
    else
      false
    end
  end
end
