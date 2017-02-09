class Product < ActiveRecord::Base
validates_presence_of :price
validate :check_price


private 
   def check_price
   	  if self.price.to_i <= 0
   		errors.add(:price, "below the range")
   	  end
   end
end





