FactoryBot.define do
  factory :offer_gender do
    association :offer
    association :gender
  end
end
