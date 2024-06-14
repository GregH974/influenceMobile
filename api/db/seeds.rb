# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Empty base seeds and reseed
table_to_seed = %i[
  genders
  age_groups
  offers
  players
  games
  player_gaming_logs
]

table_to_clear = %i[
  players
  genders
  age_groups
  offers
  users
  player_gaming_logs
  games
]

connection = ActiveRecord::Base.connection

message = 'Resetting table content'
puts message if Rails.env.development?
Rails.logger.debug message

table_to_clear.each do |table|
  connection.execute("DELETE FROM #{table} CASCADE")
  connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH 1")
end

table_to_seed.each do |table|
  require_relative "seed_models/#{table}.rb"
end
