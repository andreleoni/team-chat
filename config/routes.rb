Rails.application.routes.draw do
  # get 'team_users/create'
  # get 'team_users/destroy'
  # get 'talks/show'
  # get 'channels/create'
  # get 'channels/destroy'
  # get 'channels/show'
  # get 'teams/index'
  # get 'teams/show'
  # get 'teams/create'
  # get 'teams/destroy'

  resources :channels, only: [:show, :create, :destroy]
  resources :talks, only: [:show]
  resources :teams, only: [:create, :destroy]
  resources :team_users, only: [:create, :destroy]

  get '/:slug', to: 'teams#show'

  root to: 'teams#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
end
