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
  factory :task do
    sequence(:title) { |n| "TaskName#{n}" }
    description "Task Description"
    group
    completed false
  end
  factory :membership do
    user
    group
  end
  factory :contact do
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name 'bob'
    last_name 'saget'
    company_name 'company'
    address '123 street rd'
    city 'boston'
    state 'ma'
    zip '12345'
    phone '1234567890'
    phone_ext '123'
    category 'category'
    description 'description'
    group
  end
end
