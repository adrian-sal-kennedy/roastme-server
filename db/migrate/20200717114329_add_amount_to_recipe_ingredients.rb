# frozen_string_literal: true

class AddAmountToRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes_ingredients, :quantity, :string
  end
end
