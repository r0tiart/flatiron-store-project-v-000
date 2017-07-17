class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	has_many :carts, through: :line_items

	def self.available_items
		where("inventory > ?", 0)	
	end

	def self.quantity_adjuster(amount, item)
		item = self.find_by(id: item.id)
		item.inventory -= amount
		item.save

	end
end
