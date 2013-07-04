# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ranking do
    author
    subject
    position nil
    rank_category
  end
end
