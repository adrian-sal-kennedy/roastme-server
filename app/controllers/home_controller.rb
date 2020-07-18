class HomeController < ApplicationController
  def index
    render json: {controller:"home", action:"index", query_string:request.query_parameters}
  end
end
