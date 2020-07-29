class IngredientsController < ApplicationController
  before_action :authenticate_user, except: :index

  def list
    list = Ingredient.order(name: :asc).pluck(:name)
    render json: list
  end

  def create
    recipe = Recipe.find(params[:id]).user.id
    if current_user.id == recipe
      pp params.require(:ingredients).permit(:list)
    end
  end


end
