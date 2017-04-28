Rails.application.routes.draw do
  resources :emails
  resources :epostcards
  get 'deliver', to: 'emails#deliver', as: :deliver_epostcard
  resources :pages
  resources :lodgings
  devise_for :users
  get 'home/index'
  root to: "home#index"
  resources :users

end
