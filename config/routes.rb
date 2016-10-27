Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # resources
  resources :customer, only: [:index, :show]
  resources :credits

  # static pages
  get "/:page" => "pages#show"

  # root page
  root 'pages#show'


end
