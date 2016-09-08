class Api::V1::UsersController < Api::BaseController
  before_action :ensure_params_exist, except: :show
  before_action :find_object, only: [:show, :update]
  before_action :correct_user, only: :update
  before_action :ensure_params_true, :verify_shop, only: :index

  def show
    serializer = ActiveModelSerializers::SerializableResource.new(@user,
      params).as_json
    render json: {message: I18n.t("users.show.success"),
      data: {user: serializer}, code: 1}, status: 200
  end

  def index
    users = User.near [params[:user][:latitude], params[:user][:longitude]],
      params[:user][:distance]
    users = users.shipper.collect do |shipper|
      ActiveModelSerializers::SerializableResource.new(shipper,
        params)
    end

    if users.any?
      render json: {message: I18n.t("users.messages.get_shipper_success"),
        data: {users: users.as_json}, code: 1}, status: 200
    else
      render json: {message: I18n.t("users.messages.get_shipper_fails"),
        data: {}, code: 1}, status: 200
    end
  end

  def update
    if @user.update_with_password user_params
      serializer = ActiveModelSerializers::SerializableResource.new(@user,
        params).as_json
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
    if params[:user].nil? || params[:user][:distance].nil? ||
      params[:user][:latitude].nil? || params[:user][:longitude].nil?
      render json: {message: I18n.t("api.missing_params"), data: {}, code: 0},
        status: 422
    end
  end

  def verify_shop
    unless current_user.shop?
      render json: {message: I18n.t("users.messages.not_authorize"), data: {},
        code: 0}, status: 403
    end
  end
end
