class Api::V1::Shipper::DestroyAllBlackListsController < Api::ShipperBaseController
  before_action :load_and_check_all_black_list

  def index
    @black_list.destroy_all
    render json: {message: I18n.t("black_list.destroy_all_success"), data: {},
      code: 1}, status: 200
  end

  private
  def load_and_check_all_black_list
    @black_list = current_user.owner_black_lists
    if @black_list.blank?
      render json: {message: I18n.t("black_list.destroy_all_fail"), data: {},
        code: 1}, status: 200
    end
  end
end
