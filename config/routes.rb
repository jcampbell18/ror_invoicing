Rails.application.routes.draw do
  resources :access_levels
  resources :bid_statuses
  resources :states
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
