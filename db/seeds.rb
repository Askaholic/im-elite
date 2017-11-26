# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_table(t_class, data)
  t_class.destroy_all
  data.each do | name |
    t_class.create(name: name)
  end
end

seed_table(Sport, [
  "Baseball",
  "Flag Football",
  "Hockey",
  "Lacrosse",
  "Soccer"
])

seed_table(LeagueType, [
  "Comp",
  "Casual"
])
