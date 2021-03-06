Rails.application.routes.draw do
  resources :trains do
    resources :carriages, only: %i[new create]
  end
  resources :railway_stations do
    member do
      post :update_position
    end
  end
  resources :routes
  resources :carriages, only: [:show]
end
