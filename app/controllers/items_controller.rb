class ItemsController < ApplicationController
	def show
		cart
		@item = Item.find_by(id: params[:id])
	end
end	
