module CartHelper

	def current_cart
		current_user.current_cart if signed_in?
	end
end
