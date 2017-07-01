Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :channels, only: [:show, :create, :destroy]
  
  resources :talks, only: [:show]
  
  resources :teams, only: [:create, :destroy] do
    post :invite
  end

  resources :team_users, only: [:create, :destroy] do
    post :disable
  end

  get '/:slug', to: 'teams#show'

  root to: 'teams#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
end
