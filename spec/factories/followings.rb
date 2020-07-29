FactoryBot.define do
  factory :following do
    association :user, factory: :user
  end
end
