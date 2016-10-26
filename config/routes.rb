Rails.application.routes.draw do

  # resources
  resources :customer, only: [:index, :show]
  resources :credits

  # static pages
  get "/:page" => "pages#show"

  # root page
  root 'pages#show'


end
