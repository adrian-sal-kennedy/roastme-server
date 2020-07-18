class RecipeController < ApplicationController
  def show
    render json: {controller:"recipe", action:"show"}

  end

  def delete
    render json: {controller:"recipe", action:"delete"}

  end

  def update
    render json: {controller:"recipe", action:"update"}

  end

  def create
    render json: {controller:"recipe", action:"create"}

  end
end
