class CategoriesController < ApplicationController

	def index
		@category = Category.all
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

   #do we need this method?
  def show
  	@category = Category.find(params[:id])
  end

  private

  def category_params
  	params.require(category).permit(:name)
  end

end
