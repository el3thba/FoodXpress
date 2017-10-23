class Order < ApplicationRecord
	has_many:order_items
	has_many:product


	def subtotal
		order_items.collect {|order_item| order_item.valid? ? (order_item.unit_price*order_item.quantity) : 0}.sum
	end

	def discount
		print "*"
		self[:discount] = TotalPrice *(TotalPrice-discount)*100
		print discount
	end


		private
		def set_subtotal
			self[:subtotal] = subtotal
		end
end
