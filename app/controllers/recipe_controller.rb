class RecipeController < ApplicationController
  before_action :authenticate_user, except: :show

  def show
    render json: Recipe.find(params[:id])
  end

  def delete
    recipe = Recipe.find(params[:id])
    if (recipe.user == current_user)
      recipe.destroy
      render json: {post: params[:id], deleted: true}
    else
      render json: {post: params[:id], deleted: false, exception: exception}
    end
  end

  # need to do ingredients and tags

  def update
    recipe = Recipe.find(params[:id])

    if recipe.user == current_user
      recipe.update(recipe_params)
      render json: {post: params[:id], deleted: true}
    else
      render json: {post: params[:id], deleted: false}
    end
  end

  def create
    current_user.recipes.create(recipe_params)
    render json: {post: 1, created: true}
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:title, :blog, :method)
  end

  def additional_params
    params.require(:recipe).permit(:ingredients, :tags)
  end

end
