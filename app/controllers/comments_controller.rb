class CommentsController < ApplicationController
before_action :authenticate_user!
respond_to :html, :json
	def create
		@comment = @commentable.comments.new comment_params
		@comment.user_id = current_user
		# @comment.save
		respond_to do |format|
			if @comment.save
				flash[:success] = "Your comment was added successfully!!"
			  format.html {redirect_to @commentable}
			end
		end
	end


	def edit
   		@comment = Comment.find(params[:id])
	end
	def update
	    @comment = Comment.find(params[:id])
	    @comment.update_attributes(comment_params)
	    if @comment.save
	        respond_with @comment
	    else
	        render 'edit'
	    end
	end

	def destroy
	    @comment = Comment.find(params[:id])
	    @comment.destroy

	    respond_to do |format|
	    	flash[:success] = "Your comment was deleted successfully!"
	      format.html { redirect_to faq_path }
	      format.xml  { head :ok }
	    end
  	end	

	private
		
		def comment_params
			params.require(:comment).permit(:body, :author, :user_id)
		end
end