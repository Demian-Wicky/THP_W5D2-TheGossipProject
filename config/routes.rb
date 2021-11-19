Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'comments/create'
  get 'cities/show'
  root to: 'gossips#index'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:first_name', to: 'greets#greet'

  resources :gossips do 
    resources :comments
  end
  resources :comments

  resources :users, only: [:show]
  resources :cities, only: [:show]
  
  resources :sessions, only: [:new, :create, :destroy]

end
