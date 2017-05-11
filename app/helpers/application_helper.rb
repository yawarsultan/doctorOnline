module ApplicationHelper

 def resource_name
    :user
 end

 def resource
    @resource ||= User.new
 end

 def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
 end
  
 def bootstrap_class_for(flash_type)
  case flash_type
  when "success"
    "alert-success"   # Green
  when "error"
    "alert-danger"    # Red
  when "alert"
    "alert-warning"   # Yellow
  when "notice"
    "alert-info"      # Blue
  else
    flash_type.to_s
  end
 end

  def is_super?
    current_user.present? and current_user.super_admin?
  end

  def check_super_users?
    current_user.present? and current_user.check_admin_user?
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end
