class Order < ApplicationRecord
    has_many:order_items
	has_many:product


	def subtotal
		order_items.collect {|order_item| order_item.valid? ? (order_item.unit_price*order_item.quantity) : 0}.sum
	end

	# def discount
	# 	self[:discount] = subtotal *(subtotal-discount)*100
	# end


  	def percent_discount()
   	    self.discount/100
  	end

  	def price_discount
  		self.discount = percent_discount*TotalPrice || 0 
	end


		private
		def set_subtotal
			self[:subtotal] = subtotal
		end
end
