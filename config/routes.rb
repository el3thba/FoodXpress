Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :order_items
  resource :carts, only: [:show]
  get '/receipt' => "pages#receipt"

  root "home#index"

  root "admin#index"
  get 'admin/index'
  get 'sessions/create'

  get 'sessions/destroy'


  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login'=> :create
    delete 'logout' => :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end


end
