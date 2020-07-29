class TagsController < ApplicationController
  before_action :authenticate_user, except: :list

  def list
    list = Tag.order(tag: :asc).pluck(:tag)
    render json: list
  end

  def create
    recipe = Recipe.find(params[:id])
    count = 0
    added_tags = []

    if current_user.id == recipe.user.id
      recipe.recipes_tags.each(&:delete)

      params.require(:tags).permit(:list)[:list].split(',').each do |tag|
        tag = Tag.find_by(tag: tag) || Tag.create(tag: tag)

        recipe.recipes_tags.create(tag_id: tag.id)
        count += 1
        added_tags << tag
      end
    end

    if count.positive?
      render json: { total: count, tags: added_tags }
    else
      render json: { total: count, unsuccessful: true }
    end
  end
end
