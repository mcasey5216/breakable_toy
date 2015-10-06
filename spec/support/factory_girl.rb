require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    first_name 'bob'
    last_name 'hope'
    title 'leader'
    address '123 street rd'
    city 'boston'
    state 'ma'
    zip '12345'
    phone '1234567890'
  end
  factory :group do
    sequence(:name) { |n| "GroupName#{n}" }
    association :primary_user, factory: :user
    description "Group Description"
  end
  factory :membership do
    user
    group
  end

end
