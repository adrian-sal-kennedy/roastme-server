class CookbookController < ApplicationController
  before_action :authenticate_user

  def index
    recipes = current_user.recipes + current_user.favourite.recipes
    render json: {recipes: recipes, tags: recipes.tags}
  end
end
