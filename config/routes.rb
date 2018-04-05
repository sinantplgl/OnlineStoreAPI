Rails.application.routes.draw do
  namespace :api do
    
    # User info
  	post   'users', to: 'users#create'
  	get    'users/show', to: 'users#show'
  	patch  'user/update', to: 'users#update'
  	
    # Products
    resources :categories, only: [:index]
    get 'category/:id', to: 'categories#products'
  	
    resources :products, only: [:index, :create, :show, :destroy]
  	patch  'products/setprice/:id', to: 'products#setprice'
  	patch  'products/setquantity/:id', to: 'products#setquantity'
    patch  'products/setdiscount/:id', to: 'products#setdiscount'

    # Shopping cart / Give order
    post    'shoppingcart/add', to: 'delivery_lists#create'
    patch   'shoppingcart/update/:id', to: 'delivery_lists#update'
    delete  'shoppingcart/remove/:id', to: 'delivery_lists#destroy'

    get   'orders/all', to: 'orders#index'
    get   'orders/show', to: 'orders#show'
    patch 'orders/update_price', to: 'ordres#update_price'
    patch 'orders/update_address', to: 'orders#update_address'

    # Payment
    get   'orders/payment', to: 'orders#payment'

  	post	'authenticate', to: 'authentication#authenticate'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
