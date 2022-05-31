Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  resources :users
  resources :boats, only: [:index]
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
