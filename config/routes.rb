Rails.application.routes.draw do
  root                            'sessions#new'
  get    '/login',            to: 'sessions#new'
  post   '/login',            to: 'sessions#create'
  delete '/logout',           to: 'sessions#destroy'
  get    '/photo',            to: 'photo#list'
  get    '/photo/new',        to: 'photo#new'
  post   '/photo/new',        to: 'photo#create'
  get    '/photo/tweet/:id/', to: 'photo#tweet'
  get    'tweet/auth'    ,    to: 'tweet#auth'
  get    'oauth/callback',    to: 'tweet#callback'
end
