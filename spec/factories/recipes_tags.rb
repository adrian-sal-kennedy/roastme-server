FactoryBot.define do
  factory :recipes_tag do
    association :recipe, factory: :tag
    association :tag, factory: :tag
  end
end
