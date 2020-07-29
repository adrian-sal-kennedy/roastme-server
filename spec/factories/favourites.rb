FactoryBot.define do
  factory :favourite do
    association :user, factory: :user
  end
end
