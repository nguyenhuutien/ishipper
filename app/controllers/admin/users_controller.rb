class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :update]

  def index
    @search = User.search(params[:q])
    @users = @search.result(distinct: true).sort_by_report_desc.page(params[:page]).per Settings.per_page
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
  end

  def show
    @reports = @user.passive_reviews.report
  end

  def edit
  end

  def update
    if @user.update_attributes user_params_status
      flash[:success] = t "manage_users.update.success"
    else
      flash[:danger] = t "manage_users.update.error"
    end
    redirect_to admin_users_url
  end

  private
  def user_params_status
    params.require(:user).permit :status
  end

  def correct_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "users.messages.user_not_found"
      redirect_to admin_users_url
    end
  end
end
