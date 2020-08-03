# frozen_string_literal: true

class RecipeController < ApplicationController
  before_action :authenticate_user, except: :show

  def image
    recipe = Recipe.find(params[:id])
    if recipe.image.attached?
      render json: { image: url_for(recipe.image) }
    else
      render json: { image: false }
    end
  end

  def show
    recipe = Recipe.find(params[:id])

    render json: { recipe: recipe, ingredients: recipe.ingredients, tags: recipe.tags, author: recipe.user }
  end

  def delete
    recipe = Recipe.find(params[:id])
    if recipe.user == current_user
      recipe.destroy
      render json: { recipe: params[:id], deleted: true }
    else
      render json: { recipe: params[:id], deleted: false, exception: exception }
    end
  end

  # need to do ingredients and tags

  def update
    recipe = Recipe.find(params[:id])

    if recipe.user == current_user
      recipe.update(recipe_params)
      render json: { recipe: params[:id], deleted: true }
    else
      render json: { recipe: params[:id], deleted: false }
    end
  end

  def create
    new_recipe = current_user.recipes.new(recipe_params)
    if new_recipe.save
      render json: { recipe: new_recipe.id, created: true }
    else
      render json: { recipe: 'n/a', created: false }, status: 400
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :blog, :method, :image)
  end

  def additional_params
    params.require(:recipe).permit(:ingredients, :tags)
  end
end
