FactoryBot.define do
  factory :post do
    post { "Cool post aha" }
    association :user, factory: :user
    association :recipe, factory: :recipe

    
  end
end
