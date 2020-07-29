class HomeController < ApplicationController
  def index
    qparams = request.query_parameters
    # qparams["tag"] eg. authentic,cheap,vegan (returns recipes matching those tags)
    # qparams["ingredient"] eg. lemon,butter,cheese (returns recipes with those ingredients)
    # qparams["search"] eg. butter chicken (tries to find by name exact)
    # qparams["limit"] eg. 20 (returns 20 value)
    # qparams["offset"] eg. 15 (starts at 16th entry, after sorting)
    # qparams["order"] eg. old/new, favourites, alphabetical (sorts based on string)


    if qparams["tag"] && qparams["ingredient"]
      render json: Recipe.joins(:tags).where("tags.tag LIKE ?", qparams["tag"]).joins(:ingredients).where("ingredients.name LIKE ?", qparams["ingredient"]).limit(qparams["limit"] || 20).offset(qparams["offset"] || 0)
    elsif qparams["tag"]
      render json: Recipe.joins(:tags).where("tags.tag LIKE ?", qparams["tag"]).limit(qparams["limit"]).offset(qparams["offset"])
    elsif qparams["ingredient"]
      render json: Recipe.joins(:ingredients).where("ingredients.name LIKE ?", qparams["ingredient"]).limit(qparams["limit"]).offset(qparams["offset"])
    else
      render json: Recipe.limit(qparams["limit"]).offset(qparams["offset"])
    end
  end
end
