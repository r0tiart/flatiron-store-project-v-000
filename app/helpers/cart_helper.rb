module CartHelper

	def cart?
		!!session[:cart_id]
	end

	def current_cart
		Cart.find_by(session[:cart_id]) if cart?
	end
end
