  class CategoriesController < ApplicationController

	def index
		@categories = Category.all
    @top_projects = Project.order(end_time: :asc).limit(5)
    # respond_to do |format|
    #   format.js # allows the controller to respond to Javascript
    #   format.html
    # end
	end

	 #do we need this method?
  def new
  	@category = Category.new
  end

  #do we need this method?
  def create
  	@category = Category.new(category_params)
  	if category.save
  		redirect_to category_show
  	else
  		render :new
  	end
  end

   
  def show
  	@category = Category.find(params[:id])
    @projects = @category.projects.page(params[:page])
    
    respond_to do |format|
      format.js # allows the controller to respond to Javascript
      format.html
    end
  end

  private

  def category_params
  	params.require(category).permit(:name)
  end

end
