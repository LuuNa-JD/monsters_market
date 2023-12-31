Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  # Defines the root path route ("/")
  # root "articles#index"
  resources :monsters, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end
  resources :users do
    resources :monsters, only: [:new, :create]
    resources :bookings, only: [:new, :index, :edit, :update]
    post "/bookings", to: "bookings#create", as: "new_booking"
  end
end
