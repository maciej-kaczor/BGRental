Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get 'not_implemented', to: 'pages#not_implemented'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'unauthorized', to: 'pages#not_authorized', as: 'unauthorized'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :games do
    resources :rentals, only: [:new, :create, :return] do
    end
    get 'return', to: 'rentals#return', as: 'return'
  end
  resources :rentals, only: [:index]

end
