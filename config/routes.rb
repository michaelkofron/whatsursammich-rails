Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #resources :sammiches, except: [:index]
  resources :users, only: [:show]
  #need resources for sessions route, new session = sign in and delete session = signout
  get "/signup", to: "users#new"
  post "/signup", to: "users#create", as: :users
  get "/users/:id/sammiches", to: "users#sammiches", as: :user_sammiches
  get "/logout", to: "sessions#destroy"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#login"
  get "/popular", to: "application#popular"
  match "/auth/facebook/callback", to: "sessions#create", via: [:get, :post]
  root "application#home"
  post "sammiches/:id/delete", to: "sams#destroy", as: :destroy_sam
  resources :sams, path: "sammiches", except: [:index, :destroy] do
    resources :reviews, only: [:new, :create, :show]
    #post "reviews/:id", to: "reviews#destroy", as: :destroy_review
  end

  


end
