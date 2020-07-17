class FavouritesRecipe < ApplicationRecord
  belongs_to :favourite
  belongs_to :recipe
end
