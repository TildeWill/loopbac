# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loop do
    email { Faker::Internet.safe_email }
    created_by_email { Faker::Internet.safe_email }
    subject_email { Faker::Internet.safe_email }
    question_type 'reviewer'
  end
end
