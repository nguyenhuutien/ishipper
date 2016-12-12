module ApplicationHelper
  def avatar_profile
    @user.avatar_url || "profile.jpg"
  end

  def admin_signed_in?
    user_signed_in? && current_user.role == "Admin"
  end

  def avatar_profile user
    user.avatar_url || "profile.jpg"
  end

  def notification_content notification
    t("notifications.web.#{notification.status}",
      user_name: notification.owner.name,
      invoice_name: notification.invoice.name).html_safe
  end
end
