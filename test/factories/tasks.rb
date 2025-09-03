FactoryBot.define do
  factory :task do
    name
    description 
    author_id { 1 }
    assignee_id { 1 }
    state { "MyString" }
    expired_at { Date.today }
  end
end
