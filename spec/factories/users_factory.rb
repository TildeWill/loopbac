FactoryGirl.define do
  factory :user, aliases: [:subject, :author] do
    sequence(:uid) { |n| n.to_s }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    name { |u| "#{u.first_name} #{u.last_name}" }
  end
end
