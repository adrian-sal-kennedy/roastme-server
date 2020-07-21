class HomeController < ApplicationController
  def index
    render json: Recipe.all
  end
end
