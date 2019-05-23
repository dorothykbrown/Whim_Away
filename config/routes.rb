Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/properties/available", to: "properties#availability_params"
  resources :properties do
    resources :bookings
  end
end
