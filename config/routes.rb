Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :order_items
  resource :carts, only: [:show]
  resources :posts
  get '/receipt' => "pages#receipt"
  #get '/supplier' => "pages#supplier"
  get '/about_us' => "pages#aboutus"
  get '/contact_us' => "pages#contactus"
  get '/logout' => "sessions#logout"

  root "admin#index"


  # get 'admin/index'
  post 'sessions/create'
  get 'users/new'

get '/create' => "sessions#create"
get '/new' => "users#new"
get '/home' => "home#index"
get '/restaurant' => "restaurant#index"
get '/supplier' => "supplier#index"




  get 'sessions/destroy'
  get 'home/index'
  get 'supplier/index'
  get 'restaurant/index'
  get 'products/index'
  get '/pay' => "pages#pay"
  #get 'admin/index' => 'home#index'
  # get ''

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login'=> :create
    #delete 'logout' => :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  resources :comments
  resources :posts do
    resources :comments
  end


end
