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

ActiveRecord::Schema.define(version: 20161103145508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "team_red_id",                                     null: false
    t.integer  "team_blue_id",                                    null: false
    t.datetime "started_at",      default: '2016-11-03 15:59:43', null: false
    t.datetime "ended_at"
    t.integer  "team_red_score",  default: 0,                     null: false
    t.integer  "team_blue_score", default: 0,                     null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_team_members_on_player_id", using: :btree
    t.index ["team_id"], name: "index_team_members_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "teams", column: "team_blue_id", name: "FK_GAMES_TEAM_BLUE"
  add_foreign_key "games", "teams", column: "team_red_id", name: "FK_GAMES_TEAM_RED"
  add_foreign_key "team_members", "players"
  add_foreign_key "team_members", "teams"
end
