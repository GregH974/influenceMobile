100.times do |i|
  Offer.create({
                 title: Faker::Lorem.word,
                 description: Faker::Marketing.buzzwords,
                 score_to_achieve: (i + 1) * 100
               })
end
offers = Offer.all

# Set random offer age group
age_groups = AgeGroup.all
age_group_total = age_groups.count
age_group_indices = (1..age_group_total).to_a

age_groups.sample(age_group_indices.sample).each do |age_group|
  offers.sample(15).each do |offer|
    OfferAgeGroup.find_or_create_by(offer:, age_group:)
  end
end

# Set random offer gender
genders = Gender.all
gender_total = genders.count
indices = (1..gender_total).to_a

offers.each do |offer|
  genders.sample(indices.sample).each do |gender|
    OfferGender.find_or_create_by(offer:, gender:)
  end
end

message = 'Offers added'
puts message if Rails.env.development?
Rails.logger.debug message
