FactoryBot.define do
  factory :recipes_ingredient do
    association :recipe, factory: :recipe
    association :ingredient, factory: :ingredient
  end
end
