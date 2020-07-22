class Ingredient < ApplicationRecord
    # validations
    validates :name, presence: true

    # associations
    has_many :recipes_ingredients
    has_many :recipes, through: :recipes_ingredients
end
