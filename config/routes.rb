Rails.application.routes.draw do
  root 'pages#home'
  get "/about", to: "pages#about"
  resources :categories, only: [:index, :show]
  resources :posts, only: [:index, :show]
  resources :subscriptions, only: [:create]
  
  namespace :admin do
    resources :posts  # ← полный CRUD
  end
end
