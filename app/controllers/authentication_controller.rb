class AuthenticationController < ApplicationController
  def login
    render json: {controller:"auth", action:"login"}
  end

  def signup
    render json: {controller:"auth", action:"signup"}
  end
end
