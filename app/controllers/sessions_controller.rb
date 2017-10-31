class SessionsController < ApplicationController
  # skip_before_action :authorize
  def new
    
  end

  def create
    user =User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      # if user.role = "Restaurant"
      #   redirect_to orders_url
      # end
      # if user.role = "Supplier"
      #   redirect_to carts_url
      # end
      # if user.role = "admin"
      #   redirect_to admin_url
      # end

    else
      redirect_to login_url, alert: "Invalid Username or Password"
  end
end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert:"Successfully logged out"

  end
end
