require 'rails_helper'

RSpec.describe Post, type: :model do
  subject {
    build :post
  }

  context "validations" do
    it "should be valid with valid attributes" do

    end

    it "should validate presence of post" do
      expect(subject).to validate_presence_of(:post)
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
