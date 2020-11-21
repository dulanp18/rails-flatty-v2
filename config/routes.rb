Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :flats

  resources :tenants

  get '/home', to: 'flats#home', as: 'home'
  post '/join', to: 'flats#join', as: 'join'
  post '/remove', to: 'flats#remove', as: 'remove'

  get '/find_tenant', to: 'tenants#find', as: 'find_tenant'





end
