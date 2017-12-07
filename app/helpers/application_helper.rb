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

  def handle_error_text(object, attribute)
    content_tag(:div, "#{object.errors[attribute].first}", class: "field-error") if object.errors[attribute].present?
  end

  def handle_nest_error_text(object, attribute, nest_model)
    content_tag(:div, next_error_attr(object, nest_model, attribute).first, class: "field-error") if next_error_attr(object, nest_model, attribute).present?
  end

  def next_error_attr(object, nest_model, attribute)
    object.errors["#{nest_model}.#{attribute}"]
  end
  
  def link_to_add_fields(name, f, association, fieldset_class='', link_classes='', limit=1000)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder, fieldset_class: fieldset_class)
    end
      link_to(name, 'javascript:void(0);', class: "add_fields #{link_classes}", data: {limit: limit, fieldset_class: fieldset_class, id: id, fields: fields.gsub("\n", "")})
  end
end
