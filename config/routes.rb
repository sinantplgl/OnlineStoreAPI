Rails.application.routes.draw do
  namespace :api do
  	resources :users, only: [:create, :show, :update]
  	post 'authenticate', to: 'authentication#authenticate'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
