class PostController < ApplicationController
  before_action :authenticate_user, except: :show

  def show
    render json: {controller:"post", action:"show"}

  end

  def delete
    render json: {controller:"post", action:"delete"}

  end

  def update
    render json: {controller:"post", action:"update"}

  end

  def create
    render json: {controller:"post", action:"create"}

  end
end
