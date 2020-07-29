# frozen_string_literal: true

FactoryBot.define do
  factory :recipes_tag do
    association :recipe, factory: :recipe
    association :tag, factory: :tag
  end
end
