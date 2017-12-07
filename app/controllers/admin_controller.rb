class AdminController < ApplicationController
  before_action :check_super_user, only: [:users]
  before_action :check_not_user, only: [:users]
  # before_action :check_super_admin_or_user
	def users
		@users = User.all.order(created_at: :desc)
	end

	def posts
		@posts = Post.all
	end

	private

	# def check_super_admin_or_user
 #    unless current_user.id == @user.user_id || current_user.super_admin?
 #      redirect_to_root_with_error
 #    end
 #  end
end
