# frozen_string_literal: true

Rails.application.routes.draw do
  get 'ingredients/index'
  # test route/controller

  get '/test', to: 'test#test'

  # home

  get '/', to: 'home#index'

  # cookbook

  get '/cookbook', to: 'cookbook#index'

  # dashboard

  get '/dashboard', to: 'dashboard#index'

  # profile

  get '/profile', to: 'profile#index'

  # users

  get '/user/:id', to: 'user#show'

  # authentication

  post '/login', to: 'user_token#create'
  post '/signup', to: 'user#create'

  # posts

  get '/post/:id', to: 'post#show'
  post '/post', to: 'post#create'
  patch '/post/:id', to: 'post#update'
  delete '/post/:id', to: 'post#delete'

  # recipe

  get '/recipe/:id', to: 'recipe#show'
  post '/recipe', to: 'recipe#create'
  patch '/recipe/:id', to: 'recipe#update'
  delete '/recipe/:id', to: 'recipe#delete'

  # image

  get '/image/:id', to: 'recipe#image'

  # status

  get '/status', to: 'status#index'
  get '/status/user', to: 'status#user'

  # ingredients (for populating autocomplete in react)
  get '/ingredients', to: 'ingredients#list'
  post '/ingredients/:id', to: 'ingredients#create'

  # tags
  get '/tags', to: 'tags#list'
  post '/tags/:id', to: 'tags#create'

  # follow
  get '/follow/:id', to: 'follow#follow'
  delete '/follow/:id', to: 'follow#unfollow'
  get '/follow', to: 'follow#list'
  get '/following/:id', to: 'follow#following?'

  # favourite

  get '/favourite/:id', to: 'favourite#favourite'
  delete '/favourite/:id', to: 'favourite#unfavourite'
  get '/favourite', to: 'favourite#list'
  get '/favourited/:id', to: 'favourite#favourite?'
end
