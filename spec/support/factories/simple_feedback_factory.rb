FactoryGirl.define do
  factory :simple_feedback do
    author
    subject
    details { Faker::Lorem.paragraph }
  end
end
