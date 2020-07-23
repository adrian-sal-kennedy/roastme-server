class HomeController < ApplicationController
  def index
    recipes = []
    Recipe.last(10).reverse.each do |recipe|
      recipes << {recipe: recipe, author: recipe.user, tags: recipe.tags}
    end
    render json: recipes
  end
end
