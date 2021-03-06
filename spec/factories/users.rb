# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'username' }
    email { 'email@email.com' }
    password { 'password' }
  end
end
