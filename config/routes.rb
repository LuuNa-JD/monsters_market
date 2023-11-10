Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
  resources :monsters, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users do
    resources :monsters, only: [:new, :create]
    resources :bookings, only: [:new, :index, :edit, :update]
    post "/bookings", to: "bookings#create", as: "new_booking"
  end

end
