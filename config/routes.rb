Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users
  root to: "pages#home"
  resources :boats do
    resources :reviews, only: :create
    resources :bookings, only:[:new,:create, :update]
    get '/booking/:id', to: 'bookings#destroy', as: :delete_booking
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
