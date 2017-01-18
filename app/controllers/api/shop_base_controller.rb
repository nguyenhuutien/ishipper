class Api::ShopBaseController < Api::BaseController
  before_action :verify_shop

  private
  def verify_shop
    unless current_user.shop?
      render json: {message: I18n.t("users.messages.not_authorize"), data: {},
        code: 0}, status: 403
    end
  end

  def check_black_list
    black_user = @invoice.user_invoices - @invoice.user_invoices.init -
      @invoice.user_invoices.rejected
    unless black_user.blank?
      black_list = BlackList.find_by owner_id: current_user.id,
        black_list_user_id: black_user.first.user_id
      if black_list
        render json: {message: I18n.t("black_list.permission_denied"), data: {},
          code: 1}, status: 200
      end
    end
  end
end
