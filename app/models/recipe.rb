# frozen_string_literal: true

class Recipe < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :title, length: { in: 1..30 }

  validates :blog, presence: true
  validates :method, presence: true

  # associations

  belongs_to :user

  has_many :favourites_recipes, dependent: :delete_all
  has_many :favourites, through: :favourites_recipes

  has_many :recipes_tags, dependent: :delete_all
  has_many :tags, through: :recipes_tags

  has_many :recipes_ingredients, dependent: :delete_all
  has_many :ingredients, through: :recipes_ingredients

  has_many :posts

  has_one_attached :image
end
