Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :channels, only: [:show, :create, :destroy]
  resources :talks, only: [:show]
  resources :teams, only: [:create, :destroy]
  resources :team_users, only: [:create, :destroy]

  get '/:slug', to: 'teams#show'

  root to: 'teams#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
end
