class StoreController < ApplicationController

	def index
		cart
		@categories = Category.all
		@items = Item.available_items
	end
  
end
