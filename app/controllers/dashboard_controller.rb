class DashboardController < ApplicationController
  def index
    render json: {controller:"dashboard", action:"index"}

  end
end
