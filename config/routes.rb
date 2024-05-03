Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :sold]
end
