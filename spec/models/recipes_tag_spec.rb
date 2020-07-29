# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesTag, type: :model do
  context 'associations' do
    it 'should belong to a recipe' do
      should belong_to(:recipe)
    end

    it 'should belong to a tag' do
      should belong_to(:tag)
    end
  end
end
