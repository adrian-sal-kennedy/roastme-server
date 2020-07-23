class UserController < ApplicationController
  before_action :check_existing, only: :create
  def create
  # would use find_or_create_by here, but it is not atomic and doesn't return good stuff so it's more appropriate in seeds.rb or something
    unless @record
      User.create(user_params)
      render json: "user created", status: 200
    else
      render json: "user already exists!", status: 401
    end
  end

  def show
    user = User.find(params[:id])
    render json: {posts: user.posts, recipes: user.recipes}
    
  end
  private 
  def check_existing
    @record = User.find_by(email: params[:user][:email])
    puts "found record #{params[:user][:email]}" if @record
    # storing record in variable so rails caches the query
  end
  def user_params 
    params.require(:user).permit(:email, :password, :username)
  end 
end
