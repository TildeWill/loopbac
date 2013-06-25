### GENERATORS ###
# application.rb
config.generators do |g|
  g.factory_girl suffix: 'factory' # generates files like "users_factory.rb"
end


















### IGNORE BLOCK & TRANSIENT ATTRIBUTES ###
factory :user do
  ignore do
    rockstar true #rockstar is not a real attribute on User, but we're defaulting it to true
    upcased false #upcased is not a real attribute on User, but we're defaulting it to false
  end

  name { "John Doe#{" - Rockstar" if rockstar}" }
  email { "#{name.downcase}@example.com" }

  after(:create) do |user, evaluator| #the evaluator is the "context" of this factory call
    user.name.upcase! if evaluator.upcased
  end
end

FactoryGirl.create(:user, upcased: true).name
#=> "JOHN DOE - ROCKSTAR"





















### ASSOCIATIONS & ALIASES ###
factory :post do
  association :author, factory: :user # lengthy and not expressive
end


factory :post do
  author #leverages the aliases on the user factory
end

factory :user, aliases: [:author, :commenter] do
  #...
end










### TRAITS ###
factory :post do
  title "A title"

  factory :approved_post do
    approved true

    factory :approved_post_with_author do
      author
    end
  end

  factory :unapproved_post do
    approved false

    factory :unapproved_post_with_author do
      author
    end
  end
end

# Factory inheritance makes Will a sad panda :(
# Composition via traits!
factory :post do
  title "A title"

  trait :approved do
    approved true
  end

  trait :unapproved do
    approved false
  end

  trait :with_author do
    author
  end

  factory :approved_post, traits: [:approved]
  factory :approved_post_with_author, traits: [:approved, :with_author]
  factory :unapproved_post, traits: [:unapproved]
  factory :unapproved_post_with_author, traits: [:unapproved, :with_author]
end

FactoryGirl.create(:approved_post_with_author, title: "Best Post")
FactoryGirl.create(:post, :approved, title: "Best Post")
FactoryGirl.create(:post, :approved, :with_author, title: "Best Post")







### MODIFY FACTORIES IN GEMS ###
# from gem...
FactoryGirl.define do
  factory :user do
    full_name "John Doe"
    sequence(:username) { |n| "user#{n}" }
    password "password"
  end
end

# in your project that uses the gem...
FactoryGirl.modify do
  factory :user do
    full_name "Jane Doe"
    health 90
  end
end







### BILLION DOLLAR IDEA? DROP THE "THE" ###
# spec/support/factory_girl.rb
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.create(:user)
create(:user)
FactoryGirl.build(:user)
build(:user)