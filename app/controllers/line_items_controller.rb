class LineItemsController < ApplicationController
	def create
		@item = Item.find_by(id: params[:item_id])
		@cart = Cart.find_by(session[:cart_id]) || current_user.current_cart=()
		@cart.add_item(@item.id).save
		session[:cart_id] = @cart.id
		redirect_to cart_path(@cart)
	end
end
