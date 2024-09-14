Rails.application.routes.draw do
  get 'pages/bio'
  get 'pages/contact'
  get 'albums/index'
  get 'albums/show'
  get 'photos/index'
  get 'photos/show'
  resources :albums, only: %i[index show] do
    resources :photos, only: %i[index show]
  end

  get 'bio', to: 'pages#bio'
  get 'info', to: 'pages#contact'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'photos#index'
end
