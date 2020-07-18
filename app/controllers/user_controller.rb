class UserController < ApplicationController
  def show
    render json: {controller:"user", action:"show"}

  end
end
