class CookbookController < ApplicationController
  before_action :authenticate_user

  def index
    temp = []
    recipes = current_user.recipes + current_user.favourite.recipes
    recipes.each do |recipe|
      temp << {recipe: recipe, author: recipe.user, tags: recipe.tags, image: url_for(recipe.image)}
    end
    render json: temp
  end
end
