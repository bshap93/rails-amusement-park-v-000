Rails.application.routes.draw do
  resources :attractions

  resources :users

  root 'static#home'

  get 'signin', to: 'sessions#new'

  post 'sessions/create'

  get 'logout', to: 'sessions#destroy'






end
