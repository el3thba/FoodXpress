class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

##add condition
  include ApplicationHelper
end
