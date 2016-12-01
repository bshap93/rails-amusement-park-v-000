Rails.application.routes.draw do
  post '/users/:id', to: 'rides#take_ride', as: 'take'

  resources :attractions

  resources :users

  root 'static#home'

  get 'signin', to: 'sessions#new'

  post 'sessions/create'

  get 'logout', to: 'sessions#destroy'






end
