class RecipeController < ApplicationController
  before_action :authenticate_user, except: :show

  def show

    render json: Recipe.find(params[:id])

  end

  def delete
    recipe = Recipe.find(params[:id])
    if recipe.user == current_user
      recipe.destroy
      render json: {post: params[:id], deleted: true}
    else
      render json: {post: params[:id], deleted: false}
    end
  end

  def update
    if Recipe.find(params[:id]).user == current_user
      render json: {controller:"recipe", action:"update"}
    else
      render json: {error: true}
    end
  end

  def create
    render json: {controller:"recipe", action:"create"}
  end
end
