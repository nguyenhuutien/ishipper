module Confirm
  def ensure_params_exist
    return unless params[:user].blank?
    render json: {message: I18n.t("api.missing_params"), data: {}, code: 0}, status: 422
  end

  def error_messages object
    error = ""
    object.each do |messageType, message|
      error << messageType.to_s.classify + I18n.t("api.invalid") + "\n"
    end
    error
  end

  def load_user_authentication
    @user = User.find_for_database_authentication phone_number: user_params[:phone_number]
    return phone_number_invalid unless @user
  end

  def load_user_token
    @user_token = UserToken.find_by authentication_token: request.headers["Authorization"]
  end

  def phone_number_invalid
    render json:
      {message: I18n.t("api.phone_number_invalid"), data: {}, code: 0},
      status: 200
  end
end
