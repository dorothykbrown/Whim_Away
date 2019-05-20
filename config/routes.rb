Rails.application.routes.draw do
  get 'properties/index'
  get 'properties/show'
  get 'properties/new'
  get 'properties/create'
  get 'properties/edit'
  get 'properties/update'
  get 'properties/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :properties
  #add other routes for users and bookings
end
