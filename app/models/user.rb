class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :orders


  def current_cart=(new_cart)
  	self.carts.create
  end

  def current_cart
  	self.carts.last
  end
end
