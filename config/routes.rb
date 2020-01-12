Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sammiches, except: [:index]
  resources :users, only: [:show]
  #need resources for sessions route, new session = sign in and delete session = signout
  get "/signup", to: "users#new"
  post "/signup", to: "users#create", as: :users
  get "/logout", to: "sessions#destroy"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create", as: :users
  root "application#home"

end
