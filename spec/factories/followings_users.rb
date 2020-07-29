FactoryBot.define do
  factory :followings_user do
    association :user, factory: :user
    association :following, factory: :following
  end
end
