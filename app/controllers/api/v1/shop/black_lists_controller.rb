class Api::V1::Shop::BlackListsController < Api::ShopBaseController
  before_action :ensure_params_true, :check_user_exist, :check_exist_black_list,
    only: :create

  def create
    black_list = BlackList.new black_list_params
    black_list.owner = current_user
    if black_list.save
      render json: {message: I18n.t("black_list.create_success"),
        data: {black_list: black_list}, code: 1}, status: 200
    else
      render json: {message: I18n.t("black_list.create_fail"),
        data: {}, code: 0}, status: 200
    end
  end

  private
  def ensure_params_true
    unless CheckParams.new(BlackList::BLACK_LIST_ATTRIBUTES_PARAMS,
      params[:black_list]).params_exist?
      render json: {message: I18n.t("api.missing_params"), data: {},
        code: 0}, status: 422
    end
  end

  def black_list_params
    params.require(:black_list).permit BlackList::BLACK_LIST_ATTRIBUTES_PARAMS
  end

  def check_exist_black_list
    black_list_user = current_user.black_list_users.
      find_by id: black_list_params[:black_list_user_id]
    if black_list_user
      render json: {message: I18n.t("black_list.black_list_shop_exist"), data: {},
        code: 0}, status: 200
    end
  end

  def check_user_exist
    user = User.find_by id: black_list_params[:black_list_user_id]
    render json: {message: I18n.t("black_list.user"), data: {}, code: 0},
      status: 422 if user.nil? or user.shop?
  end
end
