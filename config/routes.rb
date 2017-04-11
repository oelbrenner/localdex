Rails.application.routes.draw do
  resources :emails
  resources :epostcards
  resources :pages
  resources :lodgings
  devise_for :users
  get 'home/index'
  root to: "home#index"
  resources :users

end
