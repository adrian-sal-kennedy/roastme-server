# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    build :user
  end

  context 'validations' do
    it 'should be valid with valid attributes' do
      should be_valid
    end

    it 'validates presence of username' do
      should validate_presence_of(:username)
    end

    it 'validates presence of email' do
      should validate_presence_of(:email)
    end

    it 'validates presence of password' do
      should validate_presence_of(:password).ignoring_interference_by_writer
    end

    it 'should have a username that is less than or eql to 20 characters' do
      should validate_length_of(:username).is_at_most(20)
    end

    it 'should have a username that is more than or eql to 1 character' do
      should validate_length_of(:username).is_at_least(1)
    end

    it 'should validate uniqueness of email' do
      should validate_uniqueness_of(:email)
    end

    it 'should validate uniqueness of username' do
      should validate_uniqueness_of(:username)
    end

    it 'should allow valid emails' do
      should allow_value('email@address.com').for(:email)
    end

    it 'should not allow invalid email addresses' do
      should_not allow_value('invalid.format').for(:email)
    end
  end

  context 'associations' do
    it 'has many recipes' do
      should have_many(:recipes).dependent(:delete_all)
    end

    it 'has many posts' do
      should have_many(:posts).dependent(:delete_all)
    end

    it 'has one following table' do
      should have_one(:following).dependent(:destroy)
    end

    it 'has on favourite table' do
      should have_one(:favourite).dependent(:destroy)
    end
  end
end
