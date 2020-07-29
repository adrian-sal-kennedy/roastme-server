class HomeController < ApplicationController
  def index
    recipes = []
    Recipe.all.each do |recipe|
      recipes << {recipe: recipe, author: recipe.user, tags: recipe.tags}
    end
    render json: recipes
  end
end
