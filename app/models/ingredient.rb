# frozen_string_literal: true

class Ingredient < ApplicationRecord
  # validations
  validates :name, presence: true

  # associations
  has_many :recipes_ingredients, dependent: :delete_all
  has_many :recipes, through: :recipes_ingredients
end
