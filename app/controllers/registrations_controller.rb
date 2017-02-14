class RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    params[:user][:role] = params[:user][:role].capitalize
    @user = User.new user_params
    if @user.shop?
      if @user.save
        flash[:success] = t "devise.signup"
        redirect_to root_path
      end
    else
      flash[:danger] = t "devise.cant_signup"
      redirect_to root_path
    end

    respond_to do |format|
      format.js
      format.html {render :new if @user.errors.any?}
    end
  end

  private
  def user_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end
end
