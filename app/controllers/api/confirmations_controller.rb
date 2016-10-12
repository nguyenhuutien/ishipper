class Api::ConfirmationsController < Devise::ConfirmationsController
  include Confirm

  before_action :ensure_params_exist
  before_action :load_user_authentication

  respond_to :json

  def new
    if @user.block_temporary? or @user.blocked?
      render json:
        {message: t("api.user_invalid"), data: {}, code: 0},
        status: 200
    else
      if @user.send_pin
        render json:
          {message: t("api.send_pin_success"), data: {}, code: 1},
          status: 200
      else
        phone_number_invalid
      end
    end
  end

  def update
    if @user.check_pin user_params[:pin]
      if @user.unactive?
        @user.activate
        generate_user_token
        serializer = ActiveModelSerializers::SerializableResource.new(@user,
          scope: {authentication: true, user_token: @user_token}).as_json
        render json:
          {message: t("api.update.success"), data: {user: serializer}, code: 1},
          status: 200
      elsif @user.actived?
        render json:
          {message: t("api.user_actived"), data: {}, code: 0}, status: 200
      else
        render json:
          {message: t("api.user_block"), data: {}, code: 0}, status: 200
      end
    else
      render json:
        {message: t("api.pin_invalid"), data: {}, code: 0}, status: 200
    end
  end

  private
  def user_params
    params.require(:user).permit :phone_number, :pin, :notification_token, :device_id
  end

  def generate_user_token
    @user_token = @user.user_tokens.create! authentication_token: Devise.friendly_token,
      notification_token: user_params[:notification_token],
      device_id: user_params[:device_id]
  end
end
