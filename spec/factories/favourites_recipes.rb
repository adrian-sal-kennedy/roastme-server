FactoryBot.define do
  factory :favourites_recipe do
    association :favourite, factory: :favourite
    association :recipe, factory: :recipe
  end
end
