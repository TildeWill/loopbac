FactoryGirl.define do
  factory :note do
    author
    subject
    details { Faker::Lorem.paragraph }
  end
end
