# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :aliases => [:coach, :subject] do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
