require 'rails_helper'

RSpec.describe Following, type: :model do
  context "associations" do
    it "should belong to user" do
      should belong_to(:user)
    end

    it "should have many followings_users" do
      should have_many(:followings_users).dependent(:delete_all)
    end

    it "should have many users" do
      should have_many(:users)
    end
  end
end