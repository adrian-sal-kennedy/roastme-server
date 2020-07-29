class IngredientsController < ApplicationController
  def index
    list = []
    Ingredient.all.each do |ingredient|
      list << ingredient.name
    end
    render json: list
  end
end
