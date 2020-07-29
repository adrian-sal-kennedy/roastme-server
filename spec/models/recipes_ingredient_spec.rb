require 'rails_helper'

RSpec.describe RecipesIngredient, type: :model do
  context "associations" do
    it "should belong to a recipe" do
      should belong_to(:recipe)
    end

    it "should belong to a ingredient" do
      should belong_to(:ingredient)
    end
  end
end
