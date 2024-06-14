FactoryBot.define do
  factory :offer_age_group do
    association :offer
    association :age_group
  end
end
