module ApplicationHelper
  def admin_signed_in?
    user_signed_in? && current_user.role == "Admin"
  end

  def avatar_profile avatar_url
    avatar_url || "profile.jpg"
  end

  def sidebar_active controller_name
    "menu-active" if params[:controller] == controller_name
  end
end
