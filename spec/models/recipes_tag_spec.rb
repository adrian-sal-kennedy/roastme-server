require 'rails_helper'

RSpec.describe RecipesTag, type: :model do
  subject {
    build :recipes_tag
  }

  context "associations" do
    it "should belong to a recipe" do
      expect(subject).to belong_to(:recipe)
    end

    it "should belong to a tag" do
      expect(subject).to belong_to(:tag)
    end
  end
end
