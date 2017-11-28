class AdminController < ApplicationController
  
  def index
  	@products = Product.all.order("date ASC")

  end
end
