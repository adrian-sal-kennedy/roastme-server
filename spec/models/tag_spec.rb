require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject {
    build :tag
  }

  context "validations" do
    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "should validate presence of tag" do
      should validate_presence_of(:tag)
    end

    it "should have at most 20 characters" do
      should validate_length_of(:tag).is_at_most(20)
    end

    it "should have at least 1 character" do
      should validate_length_of(:tag).is_at_least(1)
    end

    it "should allow valid tags" do
      should allow_value("tag").for(:tag)
    end  

    it "should not allow invalid tags" do
      should_not allow_value("123tag").for(:tag)
    end  
  end

  context "associations" do
    it "should have many recipe_tags" do
      should have_many(:recipes_tags).dependent(:delete_all)
    end

    it "should have many recipes" do
      should have_many(:recipes)
    end
  end
end