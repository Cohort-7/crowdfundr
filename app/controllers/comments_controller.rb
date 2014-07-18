class CommentsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@comment = @project.comments.new(text: params[:comment][:text])
		if @comment.save
			redirect_to @project
		else
			render @project
		end
	end

end
