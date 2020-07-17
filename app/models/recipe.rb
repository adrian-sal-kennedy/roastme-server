class Recipe < ApplicationRecord
    belongs_to :user

    has_many :favourites_recipes
    has_many :favourites, through: :favourites_recipes

    has_many :recipes_tags
    has_many :tags, through: :recipes_tags

    has_many :recipes_ingredients
    has_many :ingredients, through: :recipes_ingredients

    has_many :posts
end
