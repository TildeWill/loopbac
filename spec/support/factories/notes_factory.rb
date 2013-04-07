FactoryGirl.define do
  factory :note do
    user
    about_email { Faker::Internet.safe_email }
    details { Faker::Lorem.paragraph }
  end
end
