Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :rides
  resources :attractions

  get '/signin', to: "session#new"
  post '/session', to: "session#create"
  delete '/session', to: "session#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
