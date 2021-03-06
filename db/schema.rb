# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171128030756) do

  create_table "games", force: :cascade do |t|
    t.datetime "date", null: false
    t.decimal "team_1_points", default: "0.0"
    t.decimal "team_2_points", default: "0.0"
    t.integer "team_1_id", null: false
    t.integer "team_2_id", null: false
    t.integer "team_winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "league_id"
    t.index ["league_id"], name: "index_games_on_league_id"
    t.index ["team_1_id"], name: "index_games_on_team_1_id"
    t.index ["team_2_id"], name: "index_games_on_team_2_id"
    t.index ["team_winner_id"], name: "index_games_on_team_winner_id"
  end

  create_table "league_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string "sport", null: false
    t.string "l_type", null: false
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_leagues_on_season_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organization_id", null: false
    t.index ["organization_id"], name: "index_players_on_organization_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_seasons_on_organization_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "league_id", null: false
    t.decimal "wins"
    t.decimal "ties"
    t.decimal "losses"
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

end
