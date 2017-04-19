class UserpanelController < ApplicationController
	before_action :authenticate_user!
	def index
		
	end

	def account
		@user = User.find(current_user.id)
	end

	def prescription
		if current_user.super_admin?
			@presriptions = Presription.all
		elsif current_user.doctor?
		@presriptions = Presription.where(user_id: current_user.id)
		else 
			@presriptions = Presription.where(user_email: current_user.email)
		end
	end

	def patient_history
		if current_user.super_admin?
			@histories = History.all
		else
			@histories = History.where(user_id: current_user.id)
		end
	end

	def video
		
	end
	
	def edit
		@user = User.find(:id)
		
	end

end
