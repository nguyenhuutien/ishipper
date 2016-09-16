class Api::V1::Shipper::FavoriteListsController < Api::ShipperBaseController
  before_action :ensure_params_exist, :check_favorite_user,
    :check_exist_favorite_list

  def create
    favorite_list = FavoriteList.new favorite_list_params
    favorite_list.owner = current_user
    if favorite_list.save
      render json: {message: I18n.t("favorite_list.create_success"),
        data: {favorite_list: favorite_list}, code: 1}, status: 200
    else
      render json: {message: I18n.t("favorite_list.create_fail"), data: {},
        code: 0}, status: 200
    end
  end

  private
  def favorite_list_params
    params.require(:favorite_list).permit FavoriteList::FAVORITE_LIST_ATTRIBUTES_PARAMS
  end

  def ensure_params_exist
    unless CheckParams.new(FavoriteList::FAVORITE_LIST_ATTRIBUTES_PARAMS,
      params[:favorite_list]).params_exist?
      render json: {message: I18n.t("favorite_list.missing_params"), data: {},
        code: 0}, status: 422
    end
  end

  def check_favorite_user
    user = User.find_by_id favorite_list_params[:favorite_list_user_id]
    render json: {message: I18n.t("favorite_list.favorite_user_invalid"), data: {},
      code: 0}, status: 200 if user.nil? || user.shipper?
  end

  def check_exist_favorite_list
    favorite_list_user = current_user.favorite_list_users.
      find_by id: favorite_list_params[:favorite_list_user_id]
    if favorite_list_user
      render json: {message: I18n.t("favorite_list.favorite_list_shop_exist"),
        data: {}, code: 0}, status: 200
    end
  end
end
