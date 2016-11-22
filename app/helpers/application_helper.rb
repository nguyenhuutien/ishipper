module ApplicationHelper
  def admin_signed_in?
    user_signed_in? && current_user.role == "Admin"
  end

  def avatar_profile user
    user.avatar_url || "profile.jpg"
  end
end
