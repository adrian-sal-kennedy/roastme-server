class CookbookController < ApplicationController
  before_action :authenticate_user

  def index
    render json: {controller:"cookbook", action:"index"}

  end
end
