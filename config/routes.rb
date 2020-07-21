Rails.application.routes.draw do
  # test route/controller

  get '/test', to: "test#test"

  # home

  get '/', to: "home#index"

  # cookbook
  
  get '/cookbook', to: "cookbook#index"

  # dashboard

  get '/dashboard', to: "dashboard#index"

  # profile

  get '/profile', to: "profile#index"

  # users

  get '/user/:id', to: "user#show"

  # authentication

  get '/login', to: "user_token#create"
  post '/login', to: "user_token#create"
  post '/signup', to: "user#create"

  # posts

  get '/post/:id', to: "post#show"
  post '/post', to: "post#create"
  patch '/post/:id', to: "post#update"
  delete '/post/:id', to: "post#delete"

  # recipe

  get '/recipe/:id', to: "recipe#show"
  post '/recipe', to: "recipe#create"
  patch '/recipe/:id', to: "recipe#update"
  delete '/recipe/:id', to: "recipe#delete"

  # status

  get "/status", to: "status#index"
  get "/status/user", to: "status#user"

end
