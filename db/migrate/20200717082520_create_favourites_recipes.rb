# frozen_string_literal: true

class CreateFavouritesRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites_recipes do |t|
      t.references :favourite, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
