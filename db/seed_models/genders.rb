[
  { name: "Woman" },
  { name: "Man" },
  { name: "Transgender" },
  { name: "Non-binary" },
  { name: "Prefer not to respond" },
].each do |gender_data|
  gender = Gender.new(gender_data)
  gender.save!
end
puts "Genders added"
