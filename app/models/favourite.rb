class Favourite < ApplicationRecord
    belongs_to :user
    has_many :favourites_recipes
    has_many :recipes, through: :favourites_recipes
end
