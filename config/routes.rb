Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'users_sessions#new'
  post '/', to: 'users_sessions#create'
  delete '/logout', to: 'users_sessions#destroy'

  get '/profile', to: 'profiles#new'

  # resources :users, only: [:new, :create]
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
end
