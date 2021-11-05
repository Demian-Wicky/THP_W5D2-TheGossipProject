Rails.application.routes.draw do

  get 'cities/show'
  root to: 'gossips#index'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:first_name', to: 'greets#greet'

  resources :gossips
  resources :users, only: [:show]
  resources :cities, only: [:show]

end
