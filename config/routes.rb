Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :games

  get 'not_implemented', to: 'pages#not_implemented'
end
