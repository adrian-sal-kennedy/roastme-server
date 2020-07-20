class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
    render json: {controller:"dashboard", action:"index"}

  end
end
