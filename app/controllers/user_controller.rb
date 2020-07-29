class UserController < ApplicationController
  before_action :check_existing, only: :create
  def create
    User.create(user_params)
    render json: 'user created'
  end

  def show
    user = User.find(params[:id])
    render json: { posts: user.posts, recipes: user.recipes }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
