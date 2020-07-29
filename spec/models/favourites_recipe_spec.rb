# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FavouritesRecipe, type: :model do
  context 'associations' do
    it 'should belong to favourites' do
      should belong_to(:favourite)
    end

    it 'should belong to recipe' do
      should belong_to(:recipe)
    end
  end
end
