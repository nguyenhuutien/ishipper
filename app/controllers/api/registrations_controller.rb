class Api::RegistrationsController < Devise::RegistrationsController
  include Confirm

  before_action :ensure_params_exist, :check_role

  respond_to :json

  def create
    user = User.new user_params
    if user.save
      if user.send_pin
        render json: {
          message: t("api.sign_up.success"),
          data: {user: user}, code: 1},
          status: 200
      else
        phone_number_invalid
      end
    else
      warden.custom_failure!
      render json: {message: error_messages(user.errors.messages), data: {}, code: 0},
        status: 200
    end
  end

  private
  def user_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end

  def ensure_params_exist
    if params[:user].nil? || params[:user][:phone_number].nil? ||
      params[:user][:password].nil? || params[:user][:password_confirmation].nil? ||
      params[:user][:role].nil? || params[:user][:name].nil?
      render json: {message: I18n.t("api.missing_params"), data: {}, code: 0},
        status: 422
    end
  end

  def check_role
    if params[:user][:role] != "shop" && params[:user][:role] != "shipper"
      render json: {message: I18n.t("api.sign_up.error_role"),
        data: {}, code: 0}, status: 200
    elsif params[:user][:role] == "shipper" && params[:user][:plate_number].nil?
      render json: {message: I18n.t("api.missing_params"), data: {}, code: 0},
        status: 422
    end
  end
end
