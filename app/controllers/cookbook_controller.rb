class CookbookController < ApplicationController
  before_action :authenticate_user

  def index
    render json: current_user.recipes + current_user.favourite.recipes
  end
end
