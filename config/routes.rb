Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :order_items
  resource :carts, only: [:show]
  resources :posts
  get '/receipt' => "pages#receipt"



  root "admin#index"


  # get 'admin/index'
  get 'sessions/create'
  get 'users/new'

get '/create' => "sessions#create"
get '/new' => "users#new"
get '/home' => "home#index"
get '/restaurant' => "restaurant#index"
# get '/supplier' => "supplier#index"




  get 'sessions/destroy'
  get 'home/index'
  # get 'supplier/index'
  get 'restaurant/index'
  get 'products/index'
  get '/pay' => "pages#pay"
  #get 'admin/index' => 'home#index'
  # get ''
  get '/supplier' => "pages#supplier"

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login'=> :create
    delete 'logout' => :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  resources :comments
  resources :posts do
    resources :comments
  end


end
