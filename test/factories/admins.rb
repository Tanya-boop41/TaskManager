FactoryBot.define do
  factory :admin do
    sequence(:first_name) { |n| "FirstName#{n}" }
    sequence(:last_name) { |n| "LastName#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:password) { |n| "Password#{n}" }
  end
end