# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tenant do
    domain { Faker::Internet.domain_name }
  end
end
