class ProductsController < ApplicationController
  
  before_action :auth_user

  
  def auth_user
    if(session[:user_id].nil?)
      redirect_to '/login'
    end
  end

  def index
    @products = Product.all.order("date ASC")
  end
  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end

  def current_order
     if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
     end
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
     @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
    def current_order
     if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
     end
  end


    private
    def product_params
      params.require(:product).permit(:title, :price, :discount, :image, :date, :unitsperpackage, :productiondate, :productbrand, :productdiscription, :supplyinstock, :deliverytime, :location, :units)
    end
end
