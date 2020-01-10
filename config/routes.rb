Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sammiches, except: [:index]
  resources :users, only: [:show]
  get "/signup", to: "users#new"
  post "/signup", to: "users#create", as: :users
  root "application#home"

end
