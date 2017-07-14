class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items

	def total
		total = line_items.collect{ |lineitem| lineitem.item.price * lineitem.quantity}.sum
	end

	def add_item(item_id)
		if line_items.exists?(item_id: item_id)
			line = line_items.where(item_id: 1).first
			line.quantity += 1
			line
		else
			self.line_items.build(item_id: item_id)
		end
	end

end
