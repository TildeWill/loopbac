FactoryGirl.define do
  factory :user, aliases: [:subject, :author] do
    coach { FactoryGirl.create(:user, :without_coach) }
    sequence(:uid) { |n| n.to_s }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    name { |u| "#{u.first_name} #{u.last_name}" }

    trait :without_coach do
      coach nil
    end
  end
end
