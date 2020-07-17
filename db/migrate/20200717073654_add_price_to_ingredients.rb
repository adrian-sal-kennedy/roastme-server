class AddPriceToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :price, :int
  end
end
