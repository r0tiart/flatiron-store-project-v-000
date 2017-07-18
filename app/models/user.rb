class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :orders


  def current_cart=(new_cart)
    if !!new_cart
  	 self.carts.create
    else
      self.carts.destroy_all
    end
  end

  def current_cart
  	self.carts.last 
  end

  def order(cart)
    order = Order.new(user_id: self.id)
    cart.line_items.each do |line_item|
      order.line_items << line_item
    end
    order.save
  end

  def current_order
    self.orders.last
  end
end
