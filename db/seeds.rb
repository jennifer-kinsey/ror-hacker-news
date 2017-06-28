# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Link.destroy_all

50.times do |index|
  link = Link.create!(
    user: Faker::HitchhikersGuideToTheGalaxy.character,
    description: Faker::HitchhikersGuideToTheGalaxy.marvin_quote,
    link_url: Faker::Internet.url,
    rank: Faker::Number.between(1, 350),
  )
  Faker::Number.between(3, 30).times do |index|
    link.comments.create!(
      user: Faker::RickAndMorty.character,
      comments: Faker::RickAndMorty.quote,
      rank: Faker::Number.between(1, 50),
    )
  end
end
