require 'rails_helper'

RSpec.describe Favourite, type: :model do
  context "associations" do
    it "should belong to a user" do
      should belong_to(:user)
    end

    it "should have many favourite_recipes" do
      should have_many(:favourites_recipes)
    end

    it "should have many recipes" do
      should have_many(:recipes)
    end
  end
end