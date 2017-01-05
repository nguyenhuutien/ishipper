class ShopsController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index
  before_action :load_support, only: [:index, :show]

  def index
  end

  def show
    @reviews = @shop.passive_reviews
  end

  def edit
    @shop = current_user
  end

  def update
    if @shop.update_with_password user_params
      flash[:success] = t "users.messages.update_success"
      bypass_sign_in @shop
      redirect_to shop_root_path
    else
      respond_to do |format|
        format.js {render partial: "shared/error_messages",
          locals: {object: @shop}, status: 200, error: 1}
      end
    end
  end

  private
  def user_params
    params.require(:user).permit User::UPDATE_ATTRIBUTES_PARAMS
  end

  def load_support
    @supports = Supports::User.new current_user: current_user
  end
end
