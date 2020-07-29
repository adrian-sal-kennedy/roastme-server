# frozen_string_literal: true

class RemovePriceFromIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :price
  end
end
