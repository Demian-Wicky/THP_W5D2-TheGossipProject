Rails.application.routes.draw do


  root to: 'gossips#index'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:first_name', to: 'greets#greet'


  resources :gossips, only: [:index, :show]
  resources :users, only: [:show]




end
