FactoryBot.define do
  factory :user_recipe do
    association :user, factory: :user
    association :recipe, factory: :recipe
  end
end
