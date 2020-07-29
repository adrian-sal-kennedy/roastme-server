class HomeController < ApplicationController
  def index
    qparams = request.query_parameters
    # qparams["tag"] eg. authentic,cheap,vegan (returns recipes matching those tags)
    # qparams["ingredient"] eg. lemon,butter,cheese (returns recipes with those ingredients)
    # qparams["search"] eg. butter chicken (tries to find by name exact)
    # qparams["limit"] eg. 20 (returns 20 value)
    # qparams["offset"] eg. 15 (starts at 16th entry, after sorting)
    # qparams["order"] eg. old/new, favourites, alphabetical (sorts based on string)

    # recipes = []
    # Recipe.all.each do |recipe|
    #   recipes << {recipe: recipe, author: recipe.user, tags: recipe.tags}
    # end
    # render json: recipes

    if qparams["tag"] && qparams["ingredient"]
      render json: list(Recipe.joins(:tags).where("tags.tag LIKE ?", qparams["tag"]).joins(:ingredients).where("ingredients.name LIKE ?", qparams["ingredient"]).limit(qparams["limit"] || 20).offset(qparams["offset"] || 0))
    elsif qparams["tag"]
      render json: list(Recipe.joins(:tags).where("tags.tag LIKE ?", qparams["tag"]).limit(qparams["limit"]).offset(qparams["offset"]))
    elsif qparams["ingredient"]
      render json: list(Recipe.joins(:ingredients).where("ingredients.name LIKE ?", qparams["ingredient"]).limit(qparams["limit"]).offset(qparams["offset"]))
    else
      render json: list(Recipe.limit(qparams["limit"]).offset(qparams["offset"]))
    end
  end

  private

  def list(recipes)
    list = []
    recipes.each do |recipe|
      list << {recipe: recipe, author: recipe.user, tags: recipe.tags}
    end

    return list
  end

end
