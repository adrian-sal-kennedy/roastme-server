FactoryBot.define do
  factory :recipe do
    title { "Example title" }
    blog { "Cool story" }
    add_attribute(:method) { "string" }
    association :user, factory: :user
  end
end
