class ProjectsController < ApplicationController
  before_action :load_current_user, only: [:edit]
  before_action :ensure_logged_in, only: [:new, :create, :edit]

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
    if @user && @user.id != @project.user_id
      redirect_to root_path
      flash.now[:alert] = "You do not have permission to edit this project..."
    end
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
