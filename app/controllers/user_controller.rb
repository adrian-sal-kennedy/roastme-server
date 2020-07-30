# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user, only: :self

  def create
    User.create(user_params)
    render json: 'user created'
  end

  def show
    posts = []
    User.find(params[:id]).posts.each do |post|
      posts << { post: post, author: post.user, recipe: post.recipe }
    end
    render json: posts
  end

  def self
    posts = []
    current_user.posts.each do |post|
      posts << { post: post, author: post.user, recipe: post.recipe }
    end
    render json: posts
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
