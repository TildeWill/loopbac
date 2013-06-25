# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    subject
    reviewer
    content "MyText"
  end
end
