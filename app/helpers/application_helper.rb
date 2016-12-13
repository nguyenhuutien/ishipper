module ApplicationHelper
  def admin_signed_in?
    user_signed_in? && current_user.role == "Admin"
  end

  def avatar_profile avatar_url
    avatar_url || "profile.jpg"
  end

  def notification_content notification
    t("notifications.web.#{notification.status}",
      user_name: notification.owner.name,
      invoice_name: notification.invoice.name).html_safe
  end
end
