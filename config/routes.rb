Rails.application.routes.draw do

  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'users#create'
  delete '/logout', to: 'users#destroy'

end
