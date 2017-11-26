# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sports_list = [
  "Baseball",
  "Flag Football",
  "Hockey",
  "Lacrosse",
  "Soccer"
]

sports_list.each do | name |
  Sport.create(name: name)
end
