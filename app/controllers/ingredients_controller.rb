class IngredientsController < ApplicationController
  before_action :authenticate_user, except: :list

  def list
    list = Ingredient.order(name: :asc).pluck(:name)
    render json: list
  end

  def create
    recipe = Recipe.find(params[:id])
    count = 0
    added_ingredients = []

    if current_user.id == recipe.user.id
      recipe.recipes_ingredients.each(&:delete)

      params.require(:ingredients).permit(:list)[:list].split(',').each do |name|
        ingredient = Ingredient.find_by(name: name) || Ingredient.create(name: name)

        recipe.recipes_ingredients.create(ingredient_id: ingredient.id)
        count += 1
        added_ingredients << ingredient
      end
    end

    if count.positive?
      render json: { total: count, ingredients: added_ingredients }
    else
      render json: { total: count, unsuccessful: true }
    end
  end
end
