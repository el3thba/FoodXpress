class HomeController < ApplicationController
  def index
  	@products = Product.where(["title LIKE ?","%#{params[:search]}%"])
  	@order_item = current_order.order_items.new
  end
  	def current_order
		 if !session[:order_id].nil?
			Order.find(session[:order_id])
		else
			Order.new
		 end
	end
end
