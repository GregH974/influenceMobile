FactoryBot.define do
  factory :offer_player do
    association :player
    email_send { false }
  end
end
