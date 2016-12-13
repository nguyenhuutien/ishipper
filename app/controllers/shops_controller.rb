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
  end

  def update
    if @shop.update_attributes user_params
      flash[:success] = t "users.save_success"
      redirect_to shop_url @shop
    else
      render :edit
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
