class HomeController < ApplicationController
  def index
    recipes = []
    Recipe.limit(10).each do |recipe|
      recipes << {recipe: recipe, author: recipe.user, tags: recipe.tags, image: url_for(recipe.image)}
    end
    render json: recipes
  end
end
