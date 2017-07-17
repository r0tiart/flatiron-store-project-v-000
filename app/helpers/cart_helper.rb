module CartHelper

	def cart?
		!!current_cart
	end

	def current_cart
		current_user.current_cart if signed_in?
	end
end
