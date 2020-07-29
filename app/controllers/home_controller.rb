class HomeController < ApplicationController

  def index
    qparams = request.query_parameters
    list = []
    # qparams["tag"] eg. authentic,cheap,vegan (returns recipes matching those tags)
    # qparams["ingredient"] eg. lemon,butter,cheese (returns recipes with those ingredients)
    # qparams["search"] eg. butter chicken (tries to find by name exact)
    # qparams["limit"] eg. 20 (returns 20 value)
    # qparams["offset"] eg. 15 (starts at 16th entry, after sorting)
    # qparams["order"] eg. old/new, alpha (sorts based on string)

    recipes = Recipe.where(nil)
    recipes = recipes.joins(:tags).where("tags.tag LIKE ?", qparams["tag"]) if qparams["tag"]
    recipes = recipes.joins(:ingredients).where("ingredients.name LIKE ?", qparams["ingredient"]) if qparams["ingredient"]
    recipes = recipes.where("title LIKE ?", "%#{qparams["search"]}%") if qparams["search"]

    if qparams["order"]
      case qparams["order"]
      when "old"
        recipes = recipes.order("created_at DESC")
      when "new"
        recipes = recipes.order("created_at ASC")
      when "alpha"
        recipes = recipes.order("title ASC")
      when "alpha-rev"
        recipes = recipes.order("title DESC")
      end
    end

    recipes = recipes.limit(qparams["limit"]) if qparams["limit"]
    recipes = recipes.offset(qparams["offset"]) if qparams["offset"]

    recipes.each do |recipe|
      list << {recipe: recipe, author: recipe.user, tags: recipe.tags}
    end

    render json: {list: list, count: recipes.length}
  end

end
