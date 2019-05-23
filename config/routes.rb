Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/my_properties', to: 'pages#my_properties'
  get '/my_bookings', to: 'pages#my_bookings'

  resources :properties do
    resources :bookings
  end
end
