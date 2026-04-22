Rails.application.routes.draw do
  root "pages#home"

  resources :lakes, only: [:index, :show]
  resources :fishing_trips
end
