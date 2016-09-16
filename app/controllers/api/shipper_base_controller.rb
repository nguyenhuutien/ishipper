class Api::ShipperBaseController < Api::BaseController
  before_action :verify_shipper

  private
  def verify_shipper
    unless current_user.shipper?
      render json: {message: I18n.t("users.messages.not_authorize"), data: {},
        code: 0}, status: 403
    end
  end

  def check_black_list
    black_list = BlackList.find_by owner_id: current_user.id,
      black_list_user_id: @invoice.user_id
    if black_list
      render json: {message: I18n.t("black_list.permission_denied"), data: {},
        code: 1}, status: 200
    end
  end
end
