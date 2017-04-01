class Api::V1::Shipper::DestroyAllFavoriteListsController < Api::ShipperBaseController
  before_action :load_and_check_all_black_list

  def index
    @favorite_list.destroy_all
    render json: {message: I18n.t("favorite_list.destroy_all_success"), data: {},
      code: 1}, status: 200
  end

  private
  def load_and_check_all_black_list
    @favorite_list = current_user.owner_favorite_lists
    if @favorite_list.blank?
      render json: {message: I18n.t("favorite_list.destroy_all_fail"), data: {},
        code: 1}, status: 200
    end
  end
end
