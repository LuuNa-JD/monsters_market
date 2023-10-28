Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  ressources :monsters, only: [:index, :show,]
  ressources :users do
    resources :monsters, only: [:new, :create]
  end
end
