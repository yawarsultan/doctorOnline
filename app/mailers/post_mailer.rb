class PostMailer < ApplicationMailer
	def question(user, post, url)
    @user = user
    @post = post
    @url  = url
    mail(to: @user.email, subject: 'Question posted successfully')
  end
end
