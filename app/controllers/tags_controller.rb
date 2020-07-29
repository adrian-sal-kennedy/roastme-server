# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :authenticate_user, except: :index

  def list
    list = Tag.order(tag: :asc).pluck(:tag)
    render json: list
  end

  def create
    tags = Tag.order(tag: :asc).pluck(:tag)
    recipe = Recipe.find(params[:id])
    count = 0
    added_tags = []

    if current_user.id == recipe.user.id
      recipe.recipes_tags.each(&:delete)

      params.require(:tags).permit(:list)[:list].split(',').each do |tag|
        tag = Tag.find_by_tag(tag)

        if tag
          recipe.recipes_tags.create(tag_id: tag.id)
          count += 1

        else
          tag = Tag.create(tag: tag)
          recipe.recipes_tags.create(tag_id: tag.id)
          count += 1
        end

        added_tags << tag
      end
    end

    if count > 0
      render json: { total: count, tags: added_tags }
    else
      render json: { total: count, unsuccessful: true }
    end
  end
  end
