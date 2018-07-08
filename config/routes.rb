Rails.application.routes.draw do
  # get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/photo',   to: 'photo#list'
  get    '/photo/new', to: 'photo#new'
  post   '/photo/new', to: 'photo#create'
end
