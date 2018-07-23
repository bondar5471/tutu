Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  resources :tickets, only: [:index ]

  namespace :admin do
    resources :welcomes, only: [:index]

    resources :railway_stations do
      member do
        patch :update_position
        patch :update_time
      end
    end

    resources :trains do
      resources :carriages, only: %i[new create]
    end

    resources :routes
    resources :carriages, only: [:show]
    resources :tickets, only: %i[index show destroy]
  end

  root 'searches#show'

  resources :trains, only: [] do
    resources :tickets, only: %i[new create]
  end

  resource :search, only: %i[show new edit create] do
    post '/', to: 'searches#search'
  end
end
