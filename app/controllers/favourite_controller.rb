# frozen_string_literal: true

class FavouriteController < ApplicationController
  before_action :authenticate_user

  def list
    recipes = []
    count = 0
    current_user.favourite.recipes.each do |recipe|
      recipes << recipe
      count += 1
    end
    render json: { recipes: recipes, total: count }
  end

  def favourite
    skip = false
    current_user.favourite.favourites_recipes.where(recipe_id: params[:id]).each do |_recipe|
      skip = true
    end
    if skip == false
      new_favourite = current_user.favroute.favourites_recipes.new(recipe_id: params[:id])
      if new_favourite.save
        render json: { user: current_user.id, favourite: params[:id], favourited: true }
      else
        render json: { user: current_user.id, favourite: params[:id], favourited: false }
      end
    else
      render json: { user: current_user.id, favourite: params[:id], favourited: true, skipped: true }
    end
  end

  def unfavourite
    match = false

    current_user.favourite.favourites_recipes.where(recipe_id: params[:id]).each do |recipe|
      recipe.delete
      match = true
    end

    if match == true
      render json: { user: current_user.id, favourite: params[:id], unfavourited: true }
    else
      render json: { user: current_user.id, favourite: params[:id], unfavourited: false }
    end
  end

  def favourite?
    following = false
    current_user.favourite.favourites_recipes.where(recipe_id: params[:id]).each do |_recipe|
      following = true
    end

    if following == true
      render json: { user: current_user.id, favourite: params[:id], favourited: true }
    else
      render json: { user: current_user.id, favourite: params[:id], favourited: false }
    end
  end
end
