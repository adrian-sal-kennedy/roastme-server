FactoryBot.define do
  factory :recipe do
    title { "Example title" }
    blog { "Cool story" }
    add_attribute(:method) { JSON.parse({step1: "cook it", step2: "eat it"}) }
    association :user, factory: :user
  end
end
