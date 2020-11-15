Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :flats

  get '/home', to: 'flats#home', as: 'home'

  get '/find_tenant', to: 'tenants#find', as: 'find_tenant'


  post '/join', to: 'flats#join', as: 'join'




end
