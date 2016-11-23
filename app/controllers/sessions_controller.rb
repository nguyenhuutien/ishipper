class SessionsController < Devise::SessionsController

  def create
    super
    create_cookie
  end

  def destroy
    super
    delete_cookie
  end

  private
  def create_cookie
    cookies[:user_id] = @user.id
  end

  def delete_cookie
    cookies.delete :user_id
  end
end
