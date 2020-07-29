# frozen_string_literal: true

class ChangeNullRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :method, false
    change_column_null :recipes, :title, false
    change_column_null :recipes, :blog, false
  end
end
