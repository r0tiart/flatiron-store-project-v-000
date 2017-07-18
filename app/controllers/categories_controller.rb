class CategoriesController < ApplicationController

	def index
		cart
		@categories = Category.all
	end

	def show
		cart
		@category = Category.find_by(id: params[:id])
	end

end
