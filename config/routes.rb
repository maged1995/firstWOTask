Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors, only: [:create]
  resources :comments, only: [:create, :update, :destroy]
  resources :blogs, only: [:create, :update, :destroy]
  resources :tags, only: [:create]

  resources :sessions, only: [:new, :create, :destroy]
  post "/login" => "sessions#create", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
end
