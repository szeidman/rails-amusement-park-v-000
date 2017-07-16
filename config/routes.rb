Rails.application.routes.draw do
  get 'sessions/new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :attractions
  resources :rides

  post '/rides/new'
  root to: 'home#index'

end
