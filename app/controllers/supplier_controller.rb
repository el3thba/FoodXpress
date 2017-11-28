class SupplierController < ApplicationController
  
  before_action :auth_user

  def index
  end

  def auth_user
  	if(session[:user_id].nil?)
  		redirect_to '/login'
  	end
  end

end
