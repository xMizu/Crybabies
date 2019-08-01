Rails.application.routes.draw do
  root 'sessions#new'
  
  #session routes
  get "/login", to: "sessions#new", as: "login"
  post "/sessions", to: "sessions#create"
  post "/logout", to: "sessions#destroy", as: 'logout'
  
  #user routes
  resources :users, only: [:delete,:show,:create,:new]
  get '/signup/', to: 'users#new', as: 'signup'
  post '/login/', to: 'sessions#create' 
  resources :games, only: [:show,:create,:new,:index,:update]
  

  get '/cry_store', to: 'topics#index', as: 'cry_store'
  resources :topics , only: [:show]
  resources :guesses , only: [:new,:create]
  resources :complaints , only: [:new,:create,:index]
  get "/rounds/:id/guess", to: "rounds#guess", as: "round_guesses"
  get "/rounds/:id/score", to: "rounds#score", as: "round_score"
  post "/rounds/:id/guess", to: "rounds#send_guess", as: "send_guesses"
  resources :game_sessions , only: [:create, :update,:show]
  resources :rounds, only: [:create,:update,:show]
  
  


end
