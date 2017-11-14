class Discount < ApplicationRecord
	belongs_to :order_item
	belongs_to :order
	belongs_to :product

  	def percent_discount()
   	    self.discount/100
  	end

  	def price_discount
  		self.discount = percent_discount*TotalPrice || 0 
	end


end
