# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    build :post
  end

  context 'validations' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should validate presence of post' do
      should validate_presence_of(:post)
    end
  end

  context 'associations' do
    it 'should belong to user' do
      should belong_to(:user)
    end

    it 'should belong to recipe' do
      should belong_to(:recipe)
    end
  end
end
