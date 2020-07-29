require 'rails_helper'

RSpec.describe User, type: :model do  
  subject {
    build :user
  }

  context "validations" do

    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "validates presence of username" do
      expect(subject).to validate_presence_of(:username)
    end

    it "validates presence of email" do
      expect(subject).to validate_presence_of(:email)
    end

    it "validates presence of password" do
      expect(subject).to validate_presence_of(:password).ignoring_interference_by_writer
    end

    it "should be invalid with an invalid email format" do
      subject.email = "invalid email"
      expect(subject).to_not be_valid
    end

    it "should have a username that is less than or eql to 20 characters" do
      expect(subject).to validate_length_of(:username).is_at_most(20)
    end

    it "should have a username that is more than or eql to 1 character" do
      expect(subject).to validate_length_of(:username).is_at_least(1)
    end
  end

  context "associations" do

    it "has many recipes" do
      expect(subject).to have_many(:recipes) 
    end

    it "has many posts" do
      expect(subject).to have_many(:posts) 
    end

    it "has one following table" do
      expect(subject).to have_one(:following)
    end

    it "has on favourite table" do
      expect(subject).to have_one(:favourite)
    end
  end
end
