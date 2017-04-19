class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions
  before_action :set_online_time, if: proc { user_signed_in? }

  def check_not_user
    redirect_to_root_with_error if current_user.patient?
  end 
  def redirect_to_root_with_error
    flash[:alert] = "You are not alowed to perform this action"
    return redirect_to root_path
  end

  def check_super_user
    respond_to do |format|
      format.html { redirect_to_root_with_error if !current_user.super_admin? }
      format.json { redirect_to_root_with_error if !current_user.super_admin? }
    end
  end

  def set_online_time

  start_time = current_user.last_sign_in_at.to_time;
  end_time = Time.now;

  if(start_time && end_time)
      minutes = time_diff(start_time, end_time)
      if(current_user.total_online_time)
        minutes = current_user.total_online_time + minutes
      end
      current_user.update_attribute(:total_online_time, minutes)
  end  

  end

  private

  def time_diff(start_time, end_time)
      (start_time -  end_time) / 60
  end
end
