class CommentsController < ApplicationController
	before_action :commentable

	def create
		@comment = @commentable.comments.new(text: params[:comment][:text])
		@comment.user = current_user
		@comment.save
		# pry
		respond_to do |format|
			format.html { redirect_to @commentable }
			format.js
		end
	end

private

	def commentable
		if params[:project_id]
			@commentable = Project.find(params[:project_id])
		elsif params[:user_id]
			@commentable = User.find(params[:user_id])
		end
	end

end
