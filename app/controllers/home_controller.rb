class HomeController < ApplicationController
  def index
    # query = request.query_parameters
    # page = query['page'] || 1

    render json: Recipe.limit(10)
  end
end
