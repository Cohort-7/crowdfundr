class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project
    if @project.save
      redirect_to @project
    else
      render action: :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end

private

  def project_params
    params.require(:project).permit(:title, :description, :goal, :picture, :tag_list, :category_id, rewards_attributes: [:id, :description, :cost, :_destroy])
  end

end
