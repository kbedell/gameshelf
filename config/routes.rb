Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :usersgames, only: [:index]
  resources :users, only: [:destroy]

  namespace :api do
    namespace :v1 do
      resources :usersgames, only: [:index, :destroy]
      namespace :boardgamegeek do
        resources :search, only: [:create]
        resources :game, only: [:create]
      end
    end
  end

  get "/pages/:page" => "pages#show"

  root 'pages#selector'
end
