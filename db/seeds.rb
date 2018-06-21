# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  Country.create(country_name: Faker::Address.country, continent: Faker::LordOfTheRings.location, population: Faker::Number.number(7), language: Faker::ProgrammingLanguage.name, world_cup: Faker::Boolean.boolean)
end
10.times do
  random_id = rand(1..Country.all.length)
  Actor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nickname: Faker::StarWars.character, age: Faker::Number.between(13, 86), country_id: random_id)
end
