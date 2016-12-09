class Api::V1::UsersController < Api::BaseController
  before_action :ensure_params_exist, except: :show
  before_action :find_object, only: [:show, :update]
  before_action :correct_user, only: :update
  before_action :ensure_params_true, only: :index

  def show
    serializer = ActiveModelSerializers::SerializableResource.new(@user).as_json
    render json: {message: I18n.t("users.show.success"),
      data: {user: serializer}, code: 1}, status: 200
  end

  def index
    if params[:user][:search]
      role = if current_user.shop?
        "Shipper"
      elsif current_user.shipper?
        "Shop"
      end
      users = User.search_user role, params[:user][:search]
    else
      user_settings = UserSetting.near [params[:user][:latitude], params[:user][:longitude]],
        params[:user][:distance], order: false
      users = User.users_by_user_setting(user_settings).shipper.users_online
    end
    users = ActiveModelSerializers::SerializableResource.new(users,
      each_serializer: UserSerializer).as_json
    render json: {message: I18n.t("users.messages.get_shipper_success"),
      data: {users: users}, code: 1}, status: 200
  end

  def update
    if @user.update_with_password user_params
      serializer = ActiveModelSerializers::SerializableResource.new(@user).as_json
      render json: {message: I18n.t("users.messages.update_success"),
        data: {user: serializer}, code: 1}, status: 200
    else
      render json: {message: error_messages(@user.errors.messages),
        data: {}, code: 0}, status: 200
    end
  end

  private
  def user_params
    params.require(:user).permit User::UPDATE_ATTRIBUTES_PARAMS
  end

  def ensure_params_true
    if params[:user].nil? || params[:user].class.to_s != "ActionController::Parameters"
      return render json: {message: I18n.t("api.missing_params"), data: {}, code: 0},
        status: 422
    else
      unless (params[:user][:distance] && params[:user][:latitude] && params[:user][:longitude]) ||
      params[:user][:search]
      render json: {message: I18n.t("api.missing_params"), data: {}, code: 0},
        status: 422
      end
    end
  end
end
