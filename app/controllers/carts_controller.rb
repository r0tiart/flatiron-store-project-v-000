class CartsController < ApplicationController
	def show
		if !!session[:cart_id]
			@cart = Cart.find_by(id: params[:id])
		else
			redirect_to "/"
		end
	end
end
