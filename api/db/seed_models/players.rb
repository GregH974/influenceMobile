# Seed Player and Users
genders = Gender.all

10.times do |i|
  user = User.create!(
    email: "player#{i+1}@example.com",
    password: 'Pass123$',
    password_confirmation: 'Pass123$',
    role: User.roles[:player]
  )
  Player.find_or_create_by(user:, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                           age: rand(18..65), gender_id: genders.sample.id)
end

players = Player.all

players.each do |player|
  age_group = AgeGroup.find_by('min_age <= ? AND max_age >= ?', player.age, player.age)

  offers = Offer.includes(:offer_age_groups).includes(:offer_genders).where(offer_age_groups: { age_group: }).where(offer_genders: { gender: player.gender })

  offers.sample(2).each do |offer|
    OfferPlayer.create(offer:, player:)
  end
end

message = 'Players and users added'
puts message if Rails.env.development?
Rails.logger.debug message
