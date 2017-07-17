class CartsController < ApplicationController
	def show
		if !!current_user.current_cart
			@cart = Cart.find_by(id: params[:id])
		else
			redirect_to "/"
		end
	end

	def checkout
		@cart = Cart.find_by(id: params[:id])
		@cart.status = "submitted"
		@cart.save
		redirect_to cart_path(@cart)
	end

	def update 
		@cart = Cart.find_by(id: params[:id])
		@cart.status = "new"
		@cart.save
		redirect_to cart_path
	end
end
