Rails.application.routes.draw do
  namespace :api do
  	post	'users', to: 'users#create'
  	get		'users/show', to: 'users#show'
  	patch	'user/update', to: 'users#update'
  	
  	resources :products, only: [:index, :create, :show, :destroy]
  	patch	'products/setprice/:id', to: 'products#setprice'
  	patch	'products/setquantity/:id', to: 'products#setquantity'

  	post	'authenticate', to: 'authentication#authenticate'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
