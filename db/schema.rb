# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141211214534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gamestats", force: true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "match_id"
    t.integer  "minutos"
    t.integer  "puntos"
    t.integer  "t2"
    t.integer  "t2a"
    t.integer  "t3"
    t.integer  "t3a"
    t.integer  "t1"
    t.integer  "t1a"
    t.integer  "rebotes"
    t.integer  "rebotesoff"
    t.integer  "assistencias"
    t.integer  "robos"
    t.integer  "tapones"
    t.integer  "perdidas"
    t.integer  "faltas"
    t.integer  "faltasrecibidas"
    t.integer  "valoracion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jornadas", force: true do |t|
    t.integer  "league_id"
    t.integer  "season_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", force: true do |t|
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "jornada_id"
    t.integer  "hometeam_id"
    t.integer  "awayteam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.integer  "team_id"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "city"
    t.integer  "nacimiento"
    t.decimal  "altura"
    t.decimal  "peso"
    t.integer  "position"
    t.integer  "shotins"
    t.integer  "shotmed"
    t.integer  "shotlong"
    t.integer  "shotfree"
    t.integer  "fuerza"
    t.integer  "speed"
    t.integer  "jump"
    t.integer  "resist"
    t.integer  "steal"
    t.integer  "block"
    t.integer  "pass"
    t.integer  "reb"
    t.integer  "mental"
    t.integer  "teamwork"
    t.integer  "potencial"
    t.integer  "intensidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.integer  "league_id"
    t.integer  "season_id"
    t.string   "name"
    t.string   "city"
    t.decimal  "balance"
    t.integer  "socios"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
