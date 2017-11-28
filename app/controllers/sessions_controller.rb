class SessionsController < ApplicationController
  # skip_before_action :authorize
  def new
    
  end

  def create
    
    check = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password]) 

    if(check)
      @user = User.find_by(email: params[:user][:email])
      session[:user_id] = @user.id
      redirect_to '/admin'
    else

      # if((@user.email == params[:user][:email]) && (@user.password == params[:user][:password]))
      flash[:invalid1] = "1Invalid Username or Password"
      redirect_to login_url
   
        
    end   
    # if(params[:user][:email])
    # user =User.find_by(name: params[:name])
    
    # if user and user.authenticate(params[:password])
    #   session[:user_id] = user.id
      # if user.role = "Restaurant"
      #   redirect_to orders_url
      # end
      # if user.role = "Supplier"
      #   redirect_to carts_url
      # end
      # if user.role = "admin"
      #   redirect_to admin_url
      # end

    # else
    #   redirect_to login_url, alert: "Invalid Username or Password"
  end


  def logout
    session[:user_id] = nil
    flash[:invalid1] = "Successfully logged out"
    redirect_to login_url

  end


end
