class UserController < ApplicationController

  def create
    User.create(user_params)
    render json: "user created", status: 200
  end

  def show
    render json: {controller:"user", action:"show"}
    
  end
  private 
  
  def user_params 
    params.require(:user).permit(:email, :password)
  end 
end
