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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130331182931) do

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "server"
    t.string   "region"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "characters", ["user_id"], :name => "index_characters_on_user_id"

  create_table "game_pets", :force => true do |t|
    t.integer  "game_id"
    t.integer  "pet_id"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "game_pets", ["game_id"], :name => "index_game_pets_on_game_id"
  add_index "game_pets", ["pet_id"], :name => "index_game_pets_on_pet_id"

  create_table "games", :force => true do |t|
    t.integer  "user_id"
    t.integer  "opponent_id"
    t.integer  "team_id"
    t.integer  "opponent_team_id"
    t.integer  "stage"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "games", ["opponent_id"], :name => "index_games_on_opponent_id"
  add_index "games", ["opponent_team_id"], :name => "index_games_on_opponent_team_id"
  add_index "games", ["team_id"], :name => "index_games_on_team_id"
  add_index "games", ["user_id"], :name => "index_games_on_user_id"

  create_table "lobbies", :force => true do |t|
    t.integer  "user_id"
    t.datetime "time"
    t.integer  "team_id"
    t.integer  "opponent_id"
    t.boolean  "accepted"
    t.datetime "challengetime"
    t.integer  "game_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "lobbies", ["game_id"], :name => "index_lobbies_on_game_id"
  add_index "lobbies", ["opponent_id"], :name => "index_lobbies_on_opponent_id"
  add_index "lobbies", ["team_id"], :name => "index_lobbies_on_team_id"
  add_index "lobbies", ["user_id"], :name => "index_lobbies_on_user_id"

  create_table "pets", :force => true do |t|
    t.string   "name"
    t.integer  "speciesId"
    t.integer  "level"
    t.integer  "health"
    t.integer  "power"
    t.integer  "speed"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pets", ["user_id"], :name => "index_pets_on_user_id"

  create_table "team_pets", :force => true do |t|
    t.integer  "pet_id"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "team_pets", ["pet_id"], :name => "index_team_pets_on_pet_id"
  add_index "team_pets", ["team_id"], :name => "index_team_pets_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teams", ["user_id"], :name => "index_teams_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
