Rails.application.routes.draw do
  
  resources :posts
  # create token
  post "/login", to: "auth#login"
  # create user AND create token
  post "/signup", to: "users#create"
  # Get user profile
  get  "/profile", to: "users#profile"
  
  resources :users, only: [:show, :destroy]
  resources :communities
end
