class ProfileController < ApplicationController
  def index
    render json: {controller:"profile", action:"index"}

  end
end
