class SessionsController < Devise::SessionsController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by phone_number: params[:user][:phone_number]
    if @user && @user.shop?
      if @user.valid_password? params[:user][:password]
        super
        create_cookie
      else
        @user.errors.add :password, t("users.invalid")
      end
    else
      @user ||= User.new
      @user.errors.add :phone_number, t("users.invalid")
    end
  end

  def destroy
    super
    delete_cookie
  end

  private
  def create_cookie
    user_token = @user.user_tokens.create! authentication_token: Devise.friendly_token
    cookies[:user_token_id] = user_token.id
  end

  def delete_cookie
    if user_token = UserToken.find_by_id(cookies[:user_token_id])
      user_token.destroy
    end
    cookies.delete :user_token_id
  end
end
