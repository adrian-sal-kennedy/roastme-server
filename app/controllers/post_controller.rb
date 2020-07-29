class PostController < ApplicationController
  before_action :authenticate_user, except: :show

  def show
    post = Post.find(params[:id])
    render json: { post: post, author: post.user, recipe: post.recipe }
  end

  def delete
    post = Post.find(params[:id])
    if post.user == current_user
      post.delete
      render json: { post: params[:id], deleted: true }
    else
      render json: { post: params[:id], deleted: false }
    end
  end

  def update
    post = Post.find(params[:id])
    if post.user == current_user
      post.update(post_params)
      render json: { post: params[:id], updated: true }
    else
      render json: { post: params[:id], updated: false }
    end
  end

  def create
    new_post = current_user.posts.new(post_params)
    if new_post.save
      render json: { post: new_post.id, created: true }
    else
      render json: { post: 'n/a', created: false }
    end
  end

  private

  def post_params
    params.require(:post).permit(:post, :recipe_id)
  end
end
