# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meta_feedback do
    kindness_score 1
    actionability_score 1
    specificity_score 1
    tenant { Tenant.first_or_create }

    trait :agreeing do
      kindness_score 4
      actionability_score 4
      specificity_score 4
    end
  end
end
