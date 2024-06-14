require 'faker'
FactoryBot.define do
  factory :player do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age { 25 }
    # association :gender, factory: :gender
    association :user, factory: :user

    transient do
      gender_type { 'Man' }  # Default to 'Male' if not specified
    end

    after(:build) do |player, evaluator|
      player.gender = create(:gender, name: evaluator.gender_type)
    end
  end
end
