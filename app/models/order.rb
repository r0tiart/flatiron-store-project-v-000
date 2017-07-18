class Order < ActiveRecord::Base
	belongs_to :user
	has_many :line_items

	def total
		total = line_items.collect{ |lineitem| lineitem.item.price * lineitem.quantity}.sum
	end
end
