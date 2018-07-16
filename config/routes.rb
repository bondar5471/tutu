Rails.application.routes.draw do
  devise_for :users
  resources :trains do
    resources :carriages, only: %i[new create]
    resources :tickets, only: %i[new create]
  end

  resources :tickets, only: [:index]

  resources :railway_stations do
    member do
      patch :update_position
      patch :update_time
    end
  end

  resources :routes
  resources :carriages, only: [:show]

  root 'searches#show'

  resource :search, only: %i[show new edit] do
    post '/', to: 'searches#search'
  end
  root to: 'home#index'
end
