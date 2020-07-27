class IngredientsController < ApplicationController
  def index
    list = []
    if params["find"].length > 0
      Ingredient.limit(10).where("lower(name) LIKE ?", "#{params["find"]}%").order(name: :asc).each do |ingredient|
        list << ingredient.name
      end
      render json: list
    end
  end
end
