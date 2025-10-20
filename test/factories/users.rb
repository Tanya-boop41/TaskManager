FactoryBot.define do
  factory :user do
    first_name { generate(:first_name) }
    last_name { generate(:last_name) }
    email { generate(:email) }
    password { generate(:password) }
    avatar { generate(:avatar) }
    type { "" }

    factory :developer do
      type { 'Developer' }
    end

    factory :manager do
      type { 'Manager' }
    end

  end
end
