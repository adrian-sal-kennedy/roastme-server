require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    build :user
  }

  context "validations" do

    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "should be invalid without a username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "should be invalid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "should be invalid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "should be invalid with an invalid email" do
      subject.email = "invalid email"
      expect(subject).to_not be_valid
    end

    it "should be invalid with long username" do
      subject.username = "usernameusernameusernameusername"
      expect(subject).to_not be_valid
    end

  end
end
