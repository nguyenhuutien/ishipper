module ApplicationHelper
  def avatar_profile
    @user.avatar_url || "profile.jpg"
  end
end
