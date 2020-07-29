require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject {
    build :recipe
  }

  context "validations" do
    it "should validate presence of title" do
      expect(subject).to be_valid
    end

    it "should validate presence of title" do
      expect(subject).to validate_presence_of(:title)
    end

    it "should validate presence of title" do
      expect(subject).to validate_presence_of(:blog)
    end

    it "should validate presence of title" do
      expect(subject).to validate_presence_of(:method)
    end
  end

  context "associations" do

    it "should have many recipes_ingredients" do
      expect(subject).to have_many(:recipes_ingredients)
    end

    it "should have many ingredients" do
      expect(subject).to have_many(:ingredients)
    end

    it "should have many recipes_tags" do
      expect(subject).to have_many(:recipes_tags)
    end

    it "should have many tags" do
      expect(subject).to have_many(:tags)
    end
  end
end
