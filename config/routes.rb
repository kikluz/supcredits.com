Rails.application.routes.draw do

  resources :sessions, only: [:new, :create]
  delete 'logout', to: 'sessions#destroy', as: 'session'

  # resources
  resources :customer, only: [:index, :show]
  resources :credits

  # static pages
  get "/:page" => "pages#show"

  # root page
  root 'pages#show'


end
