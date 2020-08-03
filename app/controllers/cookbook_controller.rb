# frozen_string_literal: true

class CookbookController < ApplicationController
  before_action :authenticate_user

  def index
    qparams = request.query_parameters
    list = []
    recipes = current_user.recipes.joins(current_user.favourite.recipes)

    recipes = recipes.joins(:tags).where('tags.tag LIKE ?', qparams['tag']) if qparams['tag']
    if qparams['ingredient']
      recipes = recipes.joins(:ingredients).where('ingredients.name LIKE ?', qparams['ingredient'])
    end
    recipes = recipes.where('title LIKE ?', "%#{qparams['search']}%") if qparams['search']

    if qparams['order']
      case qparams['order']
      when 'old'
        recipes = recipes.order('created_at DESC')
      when 'new'
        recipes = recipes.order('created_at ASC')
      when 'alpha'
        recipes = recipes.order('title ASC')
      when 'alpha-rev'
        recipes = recipes.order('title DESC')
      end
    end

    recipes = recipes.limit(qparams['limit']) if qparams['limit']
    recipes = recipes.offset(qparams['offset']) if qparams['offset']


    recipes.each do |recipe|
      list << { recipe: recipe, author: recipe.user, tags: recipe.tags }
    end
    render json: { list: list, count: list.length }
  end
end
