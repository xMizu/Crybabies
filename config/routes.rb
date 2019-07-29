Rails.application.routes.draw do
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new", as: "login"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resource :users, only: [:delete,:show,:create,:new]
  resource :rounds, only: [:create,:update]
  resource :games, only: [:show,:create,:new]
  


end
