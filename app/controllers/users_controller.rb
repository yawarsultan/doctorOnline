class UsersController < ApplicationController
   before_filter :authenticate_user!
  before_action :load_users, only: [:index]
  before_action :set_user
   def destroy
    if current_user.id == @user.id || current_user.super_admin?
      @user.destroy if @user.present?
      flash[:notice] = "User Deleted" if @user.present?
      redirect_to users_admins_path
    else  
      redirect_to_root_with_error
    end
  end

  def update
    @user.assign_attributes(user_params)
    if @user.save == false
      flash[:success] = "#{@user.errors.full_messages}"
      redirect_to user_path(@user)
    else
      @user.save!
      flash[:notice] = "User updated"
      redirect_to users_path
    end
  end

  def update_user
    if params[:user][:password].present? or params[:user][:password_confirmation].present?
      @user.assign_attributes(user_password_params)
    end
    if @user.save == false
      flash[:success] = "#{@user.errors.full_messages}"
      redirect_to user_path(@user)
    else
      @user.save!
      flash[:notice] = "User updated"
      redirect_to user_path(@user)
    end
  end
  
   def show
    if current_user.id == @user.id 
    elsif !current_user.super_admin?
      redirect_to_root_with_error
    end 
  end
 
  private

  def set_user
    @user = User.find(params[:id]) if params[:id].present?
  end

  def user_params
    params.require(:user).permit(
        :first_name, 
        :last_name,
        :email,
        :country_id,
        :role,
        :active_flag
        # ,features_attributes: [:description]
        )
  end

  

  def load_users
    if current_user.super_admin?
      @users = User.where.not(id: current_user.id)
    else
      @users = User.where(id: current_user.id)
    end
  end
end
