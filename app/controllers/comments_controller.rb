class CommentsController < ApplicationController
	before_action :commentable

	def create
		@comment = @commentable.comments.new(text: params[:comment][:text])
		@comment.user = current_user
		@comment.save
		redirect_to @commentable
	end

private

	def commentable
		if params[:project_id]
			@commentable = Project.find(params[:project_id])
			@error_path = project_path(@commentable)
		elsif params[:user_id]
			@commentable = User.find(params[:user_id])
			@error_path = user_path(@commentable)
		end
	end

end
