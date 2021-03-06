Rails.application.routes.draw do
  resources :comment_votes
  resources :chronicle_votes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"

  resources :accounts
  resources :sessions, only: [:new, :create, :destroy]
  resources :chronicles
  resources :articles

  resources :subscriptions
  resources :tags, only: [:new, :create, :destroy]
  resources :comments, only: [:new, :create, :show]
  resources :article_chronicles


  get 'searches', to: 'searches#index', as: 'searches'
  delete "logout", to: "sessions#destroy"
  get "logout", to: "sessions#destroy"
  post "add_article", to:"article_chronicles#create"

  #wildcard catch for anything and everything that has fallen through
  get "*a", to: 'application#not_found'

end
