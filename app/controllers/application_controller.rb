class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :authenticate_user!, :load_notification

  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = exception.message
    redirect_to root_path
  end

  private
  def find_object
    object = params[:controller].split("/").last.singularize
    instance_variable_set("@#{object}", object.classify.constantize.find_by_id(params[:id]))
    unless instance_variable_get "@#{object}"
      flash[:danger] = t "#{object.pluralize}.messages.#{object}_not_found"
      redirect_to root_path
    end
  end

  def current_ability
    controller_name_segments = params[:controller].split('/')
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join('/').camelize
    Ability.new current_user, controller_namespace
  end

  def load_notification
    @notifications = current_user.passive_notifications if current_user
  end
end
