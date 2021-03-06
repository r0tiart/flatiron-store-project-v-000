class LineItemsController < ApplicationController
	def create
		@item = Item.find_by(id: params[:item_id])

		if !current_user.current_cart
			current_user.current_cart=("new") 
		end
		@cart = current_user.current_cart

		@cart.add_item(@item.id).save
		session[:cart_id] = @cart.id
		redirect_to cart_path(@cart)
	end
end
