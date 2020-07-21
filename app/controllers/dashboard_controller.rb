class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
    posts = []
    current_user.following.users.each do |user| 
      user.posts.each do |post|
        posts << post
      end
    end
    render json: posts
  end
end
