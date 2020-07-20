class ProfileController < ApplicationController
  before_action :authenticate_user

  def index
    render json: {controller:"profile", action:"index"}

  end
end
