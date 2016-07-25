Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :usersgames, only: [:index, :show]
  get '/usersgames/random', to: 'usergames#show'

  resources :users, only: [:destroy]

  namespace :api do
    namespace :v1 do
      resources :usersgames, only: [:index, :create, :show, :destroy]
      get '/usersgames/random', to: 'usergames#show'
      namespace :boardgamegeek do
        resources :search, only: [:create]
        resources :game, only: [:create]
      end
    end
  end

  get '/pages/:page', to: 'pages#show'

  root 'usersgames#show'
end
