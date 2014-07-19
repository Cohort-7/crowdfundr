class PledgesController < ApplicationController

	def create
		@pledge = Pledge.new(reward_id: params[:reward_id])
		if @pledge.save
			@reward = @pledge.reward
			@project = @pledge.project
		end
		respond_to do |format|
			# format.html { redirect_to @pledge.project }
			format.js
		end
	end

end
