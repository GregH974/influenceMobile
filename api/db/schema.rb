# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_06_13_175518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "age_groups", force: :cascade do |t|
    t.integer "min_age", null: false
    t.integer "max_age", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offer_age_groups", id: false, force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "age_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id", "age_group_id"], name: "index_offer_age_groups_on_offer_id_and_age_group_id", unique: true
  end

  create_table "offer_genders", id: false, force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "gender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id", "gender_id"], name: "index_offer_genders_on_offer_id_and_gender_id", unique: true
  end

  create_table "offer_players", primary_key: ["offer_id", "player_id"], force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_send", default: false, null: false
    t.index ["offer_id"], name: "index_offer_players_on_offer_id"
    t.index ["player_id"], name: "index_offer_players_on_player_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "score_to_achieve"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_gaming_logs", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.jsonb "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_player_gaming_logs_on_game_id"
    t.index ["player_id"], name: "index_player_gaming_logs_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gender_id", null: false
    t.index ["gender_id"], name: "index_players_on_gender_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "offer_age_groups", "age_groups", name: "fk_offer_age_groups_age_groups", on_update: :cascade, on_delete: :cascade
  add_foreign_key "offer_age_groups", "offers", name: "fk_offer_age_groups_offers", on_update: :cascade, on_delete: :cascade
  add_foreign_key "offer_genders", "genders", name: "fk_offer_genders_genders", on_update: :cascade, on_delete: :cascade
  add_foreign_key "offer_genders", "offers", name: "fk_offer_genders_offers", on_update: :cascade, on_delete: :cascade
  add_foreign_key "offer_players", "offers", name: "fk_offer_players_offers", on_update: :cascade, on_delete: :cascade
  add_foreign_key "offer_players", "players", name: "fk_offer_players_players", on_update: :cascade, on_delete: :cascade
  add_foreign_key "player_gaming_logs", "games", name: "fk_player_gaming_logs_game_id", on_update: :cascade, on_delete: :nullify
  add_foreign_key "player_gaming_logs", "players", name: "fk_player_gaming_logs_player_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "players", "genders"
  add_foreign_key "players", "users", name: "fk_players_user_id", on_update: :cascade, on_delete: :cascade
end
