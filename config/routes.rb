Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  resources :monsters, only: [:index, :show,]
  resources :users do
    resources :monsters, only: [:new, :create]
  end
end
