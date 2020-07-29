require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  subject {
    build :ingredient
  }

  context "validations" do 
    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "should validate presence of name" do
      should validate_presence_of(:name)
    end
  end

  context "associations" do
    it "should have many recipes_ingredients" do
      should have_many(:recipes_ingredients).dependent(:delete_all)
    end

    it "should have mant recipes" do 
      should have_many(:recipes)
    end
  end
end