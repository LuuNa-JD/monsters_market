Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Defines the root path route ("/")
  # root "articles#index"
  resources :monsters, only: [:index, :show,]
  resources :users do
    resources :monsters, only: [:new, :create]
  end
end
