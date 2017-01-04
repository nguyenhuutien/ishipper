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

  def sidebar_active controller_name
    "menu-active" if params[:controller] == controller_name
  end

  def sort_table *args
    @q = args[0]
    @q ||= Hash.new
    @q[:attribute] = args[1]
    form_tag shop_invoices_path(q: @q.to_hash), method: :get, remote: true do
      hidden_field_tag("q[sortable]", "ASC", id: @q[:attribute]) + submit_tag(args[2], class: "nht-btn-sortable")
    end
  end
end
