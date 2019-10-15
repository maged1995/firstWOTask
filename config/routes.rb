Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors, only: [:create]
  resources :comments, only: [:create, :update, :destroy, :show]
  resources :blogs, only: [:create, :update, :destroy, :display]
  resources :tags, only: [:create]


  resources :sessions, only: [:new, :create, :destroy]
  get "/blogs" => "blogs#display", as: "blogsDisplay"
  post "/login" => "sessions#create", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
end
