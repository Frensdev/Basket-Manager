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

ActiveRecord::Schema.define(version: 20141210100215) do

  create_table "game_stats", force: true do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.integer  "position"
    t.string   "name"
    t.string   "apellido"
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

  add_index "game_stats", ["match_id"], name: "index_game_stats_on_match_id"

  create_table "jornadas", force: true do |t|
    t.integer  "liga_id"
    t.date     "fechastart"
    t.date     "fechafinish"
    t.integer  "match1_id"
    t.integer  "match2_id"
    t.integer  "match3_id"
    t.integer  "match4_id"
    t.integer  "match5_id"
    t.integer  "match6_id"
    t.integer  "match7_id"
    t.integer  "match8_id"
    t.integer  "match9_id"
    t.integer  "match10_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jornadas", ["liga_id"], name: "index_jornadas_on_liga_id"

  create_table "matches", force: true do |t|
    t.integer  "jornada_id"
    t.date     "fecha"
    t.integer  "hometeam_id"
    t.integer  "awayteam_id"
    t.integer  "gamestats_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["jornada_id"], name: "index_matches_on_jornada_id"

  create_table "players", force: true do |t|
    t.integer  "team_id"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "city"
    t.string   "nacimiento"
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

  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "teams", force: true do |t|
    t.integer  "liga"
    t.string   "name"
    t.string   "city"
    t.decimal  "balance"
    t.integer  "socios"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
