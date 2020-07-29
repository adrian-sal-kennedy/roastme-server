require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject {
    build :tag
  }

  context "validations" do
    it "should validate presence of tag" do
      expect(subject).to validate_presence_of(:tag)
    end
  end

  context "associations" do
    it "should have many recipe_tags" do
      expect(subject).to have_many(:recipes_tags)
    end

    it "should have many recipes" do
      expect(subject).to have_many(:recipes)
    end
  end

end
