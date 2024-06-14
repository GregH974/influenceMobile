[
  { min_age: 18, max_age: 24 },
  { min_age: 25, max_age: 34 },
  { min_age: 35, max_age: 44 },
  { min_age: 45, max_age: 54 },
  { min_age: 55, max_age: 64 },
  { min_age: 65, max_age: 100 }
].each do |age_data|
  age = AgeGroup.new(age_data)
  age.save!
end

message = 'Age groups added'
puts message if Rails.env.development?
Rails.logger.debug message
