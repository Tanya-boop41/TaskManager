FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "FirstName#{n}" }
    sequence(:last_name) { |n| "LastName#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:password) { |n| "Password#{n}" }
    sequence(:avatar) { |n| "Avatar#{n}.png" }
    type { "" }

    factory :developer do
      type { 'Developer' }
    end

    factory :manager do
      type { 'Manager' }
    end

  end
end
