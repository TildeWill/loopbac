# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meta_feedback do
    kindness_score 1
    actionability_score 1
    specificity_score 1
  end
end
