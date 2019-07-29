Rails.application.routes.draw do
  resources :topics , only: [:index,:show]
  resources :guesses , only: [:new,:create]
  resources :complaints , only: [:new,:create]
  resources :game_sessions , only: [:create, :update,:show]
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:delete,:show,:create]
  get '/signup', to: "users#new", as: "signup"
  resources :rounds, only: [:create,:update]
  resources :games, only: [:show,:create,:new]
  


end
