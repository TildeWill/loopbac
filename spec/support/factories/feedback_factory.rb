# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    subject
    author
    content { Faker::Lorem.paragraph}
    state :in_review
    tenant { Tenant.first_or_create }
  end
end
