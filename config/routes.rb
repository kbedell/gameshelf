Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :usersgames, only: [:index, :create, :destroy]
  resources :users, only: [:destroy]

  namespace :api do
    namespace :v1 do
      namespace :boardgamegeek do
        resources :search, only: [:create]
        resources :game, only: [:create]
      end
    end
  end

  root 'usersgames#index'
end
