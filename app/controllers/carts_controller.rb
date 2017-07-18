class CartsController < ApplicationController
	def show
		if !!current_user.current_cart
			cart = Cart.find_by(id: params[:id])
			if cart.status == "submitted"
				session[:cart_id] = nil
				current_user.carts.destroy_all

				@order = current_user.current_order
			else
				@cart = Cart.find_by(id: params[:id])
			end
		end
	end

	def checkout
		@cart = Cart.find_by(id: params[:id])
		cart = @cart
		@cart.status = "submitted"
		@cart.remove_items
		@cart.save
		current_user.order(@cart)
		redirect_to cart_path(@cart)
	end


end
