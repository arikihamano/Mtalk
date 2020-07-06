Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :rooms
  resources :users, only: %i(show)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "rooms#index"
end
