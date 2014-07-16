class PledgesController < ApplicationController

  def new
  	@pledge = Pledge.new
  end

  def create
  	@pledge = Pledge.create(pledge_params)
  	redirect_to project_path(@pledge.project)
  end

  private

  def pledge_params
  	params.require(:pledge).permit(:amount)
	end
end
