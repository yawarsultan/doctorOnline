class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:password_new_sent]
  before_action :load_users, only: [:index]
  before_action :set_user
  # load_and_authorize_resource

  def index
    @users = @users.paginate(:page => params[:page],:per_page => 10)
  end

  def show
    if current_user.id == @user.id 
    elsif !current_user.super_admin?
      redirect_to_root_with_error
    end 
  end
  
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
    @user.update_attributes(user_params)
    if @user.update(user_params)
      flash[:notice] = "User updated"
      redirect_to users_path
    else
      flash[:success] = "#{@user.errors.full_messages}"
      redirect_to user_path(@user)
    end
  end

  def update_user
    
    if params[:user][:password].present? or params[:user][:password_confirmation].present?
      @user.update_attributes(user_password_params)
    end
    if @user.update(user_params)
      flash[:notice] = "User updated"
      redirect_to admin_users_path      
    else
      flash[:success] = "#{@user.errors.full_messages}"
      redirect_to user_path(@user)
    end
  end
  
  def password_new_sent
    @user = User.find_by_id(params[:id])
    if @user.present?
      flash[:alert] = "Email '#{@user.email}' already exists. If you forgot the password. Please reset it. Link will expire in 1 Hour."
    else
      redirect_to root
    end
  end

  private

  def set_user
    @user = User.find(params[:id]) if params[:id].present?
  end

  def user_params
    params.require(:user).permit(
        :firstname, 
        :lastname,
        :email,
        :country,
        :city,
        :gender,
        :phone,
        :speciality,
        :role,
        # ,features_attributes: [:description]
        )
  end

  def user_password_params
    params.require(:user).permit(
        :password_confirmation,
        :password
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
