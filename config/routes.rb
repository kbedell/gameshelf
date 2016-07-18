Rails.application.routes.draw do
  devise_for :users

  resources :usersgames, only: [:index, :create, :destroy]
  resources :users, only: [:destroy]

  root 'usersgames#index'
end
