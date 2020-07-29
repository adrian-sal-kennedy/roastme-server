require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject {
    build :recipe
  }
  
  context "validations" do
    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "should validate presence of title" do
      should validate_presence_of(:title)
    end
    
    it "should have a title with more than 1 character" do
      should validate_length_of(:title).is_at_least(1)
    end

    it "should have a title with at most 30 characters" do
      should validate_length_of(:title).is_at_most(30)
    end
    
    it "should validate presence of blog" do
      should validate_presence_of(:blog)
    end
    
    it "should validate presence of method" do
      should validate_presence_of(:method)
    end
  end
  
  context "associations" do

    it "should have many recipes_ingredients" do
      should have_many(:recipes_ingredients).dependent(:delete_all)
    end

    it "should have many ingredients" do
      should have_many(:ingredients)
    end

    it "should have many recipes_tags" do
      should have_many(:recipes_tags).dependent(:delete_all)
    end

    it "should have many tags" do
      should have_many(:tags)
    end

    it "should have many favourites_recipes" do
      should have_many(:favourites_recipes).dependent(:delete_all)
    end

    it "should have many favourites" do
      should have_many(:favourites)
    end

    it "should belong to a user" do
      should belong_to(:user)
    end

    it "should have many posts" do
      should have_many(:posts)
    end
  end
end
