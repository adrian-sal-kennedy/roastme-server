require 'rails_helper'

RSpec.describe RecipesIngredient, type: :model do
  subject {
    build :recipes_ingredient
  }

  context "associations" do
    it "should belong to a recipe" do
      expect(subject).to belong_to(:recipe)
    end

    it "should belong to a ingredient" do
      expect(subject).to belong_to(:ingredient)
    end
  end
end
