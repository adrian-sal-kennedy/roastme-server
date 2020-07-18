Rails.application.routes.draw do
  # test route/controller

  get '/test', to: "test#test"

  # home

  get '/' 

  # cookbook
  
  get '/cookbook'

  # dashboard

  get '/dashboard'

  # profile

  get '/profile'

  # users

  get '/user/:id'

  # authentication

  post '/login'
  post '/signup'

  # posts

  get '/post/:id'
  post '/post'
  patch '/post/:id'
  delete '/post/:id'

  # recipe

  get '/post/:id'
  post '/post'
  patch '/post/:id'
  delete '/post/:id'

end
