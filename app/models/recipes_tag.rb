# frozen_string_literal: true

class RecipesTag < ApplicationRecord
  belongs_to :recipe
  belongs_to :tag
end
