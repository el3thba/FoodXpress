class OrderItemsController < ApplicationController
		def create
		@order = current_order
		@order_item = @order.order_items.new(order_item_params)
			@product = Product.find(@order_item.product_id)
			@product.supplyinstock = @product.supplyinstock - @order_item.quantity
			@product.save
		@order.save
		session[:order_id] = @order.id
	end

	def update
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		@order_item.update_attributes(order_item_params)
		@order_items = @order.order_items
	end

	def destroy
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		@order_item.destroy
		@order_items = @order.order_items
	end

	def current_order
		if !session[:order_id].nil?
			Order.find(session[:order_id])
		else
			Order.new
		end
	end

	private
		def order_item_params
			params.require(:order_item).permit(:product_id, :quantity)
		end
end
