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

  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    button_tag(name, type: :button, class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
