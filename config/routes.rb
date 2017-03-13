Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"

  resources :accounts
  resources :sessions, only: [:new, :create, :destroy]
  resources :chronicles
  resources :articles

  get 'searches', to: 'searches#index', as: 'searches'
  delete "logout", to: "sessions#destroy"

end
