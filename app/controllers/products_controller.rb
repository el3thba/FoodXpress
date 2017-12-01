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
    @product.user_id = session[:user_id]
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end



# @user = session[:user_id]
#     @product = @user.product.new(product_params)
#     @product = Product.find(@product.user_id)
#     if @product.save
#       redirect_to products_path
#     else
#       render 'new'
#     end
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

   # def product_owner
   #   unless @product.user_id == current_user.id
   #    flash[:notice] = 'Access denied as you are not owner of this product'
   #    redirect_to products_path
   #   end
   #  end

    private
    def product_params
      # if(session[:user_id].nil?)
      # @user_id = session[:user_id]
      # end
      params.require(:product).permit(:title, :price, :discount, :image, :date, :unitsperpackage, :productiondate, :productbrand, :productdiscription, :supplyinstock, :deliverytime, :location, :units)
    end
end
