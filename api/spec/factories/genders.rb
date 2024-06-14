FactoryBot.define do
  factory :gender do
    trait :man do
      name { 'Man' }
    end

    trait :woman do
      name { 'Woman' }
    end
  end
end
