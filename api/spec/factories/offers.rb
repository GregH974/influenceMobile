FactoryBot.define do
  factory :offer do
    title { Faker::Lorem.word }
    description { Faker::Marketing.buzzwords }
    score_to_achieve { 100.step(700, 100).to_a.sample }
  end
end
