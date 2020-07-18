class CookbookController < ApplicationController
  def index
    render json: {controller:"cookbook", action:"index"}

  end
end
