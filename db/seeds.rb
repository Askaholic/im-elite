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


# Insert DB data (at least 500 rows)
row_count = 0

for i in 1..3 do
  org = Organization.create(name: Faker::University.name)
  row_count += 1
  teams = []
  for i in 1..2 do
    season = org.seasons.create(start_date: Faker::Date.between(3.months.ago, Date.today), end_date: Faker::Date.between(Date.today, 3.months.from_now))
    row_count += 1
    for i in 1..3 do
      league = season.leagues.create(sport: Sport.find(rand(1..5)).name, l_type: LeagueType.find(rand(1..2)).name)
      row_count += 1
      for i in 1..5 do
        teams << league.teams.create(name: Faker::Team.name)
        row_count += 1
      end
    end
  end
  for i in 1..150 do
    org.players.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, team_id: teams[rand(1..(teams.size - 1))].id)
    row_count += 1
  end
end

puts "Created " + row_count.to_s + " rows"
