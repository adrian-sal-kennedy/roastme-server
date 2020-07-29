# frozen_string_literal: true

class FavouritesRecipe < ApplicationRecord
  belongs_to :favourite
  belongs_to :recipe
end
