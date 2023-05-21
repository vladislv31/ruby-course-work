Rails.application.routes.draw do
  get 'product/new'
  get 'restaurants/new'
  get 'admin/index'
  get 'home/index'
  root 'home#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'cart', to: 'cart_items#index'

  get '/admin', to: 'admin#index'
  get '/admin/restaurants/new', to: 'restaurants#new'

  resources :users, only: [:create]
  resources :restaurants

  get 'restaurants/delete/:id', to: 'restaurants#destroy', as: 'restaurant_destroy'
  
  resources :restaurants do
    resources :products
  end

  resources :products, only: [:destroy]

  resources :cart_items, only: [:create, :destroy] do
    patch :update_quantity, on: :member
  end

  resources :orders, only: [:create, :index]

  resources :orders do
    member do
      patch :mark_in_progress
      patch :mark_done
      patch :mark_canceled
    end
  end
end
