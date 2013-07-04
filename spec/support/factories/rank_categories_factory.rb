# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rank_category do
    position 1
    title Faker::Lorem.word
    description Faker::Lorem.paragraph
  end
end
