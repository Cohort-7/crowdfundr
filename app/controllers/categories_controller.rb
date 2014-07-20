class CategoriesController < ApplicationController

	def index
		@categories = Category.all
    @projects = if params[:search]
      Project.tagged_with(["#{params[:search].strip.gsub(/\s/, ", ")}"], any: true, wild: true)
    else
      Project.order(end_time: :asc).limit(6)
    end

    respond_to do |format|
      format.html
      format.js
    end
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
  end

  private

  def category_params
  	params.require(category).permit(:name)
  end

end
