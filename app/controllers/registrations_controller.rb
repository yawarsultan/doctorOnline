class RegistrationsController < Devise::RegistrationsController
	# skip_before_filter :require_no_authentication, only: [:new, :create, :cancel]
	# def new
 #      if !current_user.present? || (current_user && current_user.super_admin?)
 #        super
 #      else
 #        redirect_to_root_with_error
 #      end
 #    end

 #    def create
 #      if current_user.present? and !current_user.super_admin?
 #        params[:user][:role] = "patient"
 #      end
 #      # @user = User.find_by_email(params[:user][:email])
 #      # if @user.present?
        
 #      #   redirect_to password_new_sent_user_path(@user)
 #      # else
 #      #   super
 #      # end
 #    end

	private

	def sign_up_params
		params.require(:user).permit(:firstname,:lastname,:phone,:gender,:country,:city, :email,:password,:password_confirmation, :speciality,:role, :total_online_time, :avatar)
	end
	def account_update_params
		params.require(:user).permit(:firstname,:lastname,:phone,:gender,:country,:city,:email,:password,:password_confirmation,:current_password, :speciality, :role,:total_online_time, :avatar)
	end
end