Rails.application.routes.draw do
  get 'restaurants/new'
  get 'admin/index'
  get 'home/index'
  root 'home#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  get '/admin', to: 'admin#index'
  get '/admin/restaurants/new', to: 'restaurants#new'

  resources :users, only: [:create]
  resources :restaurants

  # resources :admin do
  #  resources :restaurants, only: [:new, :create]
  # end
end
