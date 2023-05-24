Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  # post '/users/signup', to: 'users#create'
  # post '/users/login', to: 'users#login'
  # delete '/users/logout', to: 'users#destroy'
  # post 'sessions/signup', to: 'sessions#sessions'

  # resources :users, only: [:create]
  resources :users
  post 'users/signup', to: 'users#create'
  post '/users/login', to: 'users#login'
  delete 'users/logout', to: 'sessions#destroy'

  resources :profiles, only: [:index, :create, :destroy]
  put '/profiles', to: 'profiles#update'
  delete '/profiles', to: 'profiles#destroy'


end
