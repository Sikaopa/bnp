Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users
  root to: "pages#home"
  resources :boats, only: [:index,:show]
  resources :bookings, only:[:index,:new,:create,:show, :update]
  get '/booking/:id', to: 'bookings#destroy', as: :delete_booking
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
