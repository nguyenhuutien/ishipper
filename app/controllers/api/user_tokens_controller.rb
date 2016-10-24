class Api::UserTokensController < Api::BaseController
  include Authenticable
  include Confirm

  before_action :authenticate_with_token!
  before_action :ensure_params_true
  before_action :load_user_token

  def update
    if @user_token.update_attributes user_token_params
      render json: {message: I18n.t("api.update.success"), data: {}, code: 1},
        status: 200
    else
      render json: {message: I18n.t("api.update.fail"), data: {}, code: 1},
        status: 200
    end
  end

  private
  def user_token_params
    params.require(:user_token).permit :registration_id
  end

  def ensure_params_true
    if params[:user_token].nil? || params[:user_token][:registration_id].nil?
      render json: {message: I18n.t("api.missing_params"), data: {}, code: 0},
        status: 422
    end
  end
end
