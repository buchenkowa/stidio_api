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

ActiveRecord::Schema[7.2].define(version: 2026_11_26_183717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "training_id", null: false
    t.string "status", default: "booked", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id", "training_id"], name: "index_bookings_on_client_id_and_training_id", unique: true
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["training_id"], name: "index_bookings_on_training_id"
  end

  create_table "client_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "birth_date"
    t.integer "height_cm"
    t.boolean "diary_shared", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_client_profiles_on_user_id", unique: true
  end

  create_table "food_entries", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "recorded_at", null: false
    t.string "meal_type", null: false
    t.integer "calories"
    t.integer "carbs"
    t.integer "protein"
    t.integer "fat"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_food_entries_on_client_id"
  end

  create_table "progress_entries", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "author_id", null: false
    t.date "recorded_on", null: false
    t.string "metric", null: false
    t.decimal "value", precision: 8, scale: 2, null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_progress_entries_on_author_id"
    t.index ["client_id"], name: "index_progress_entries_on_client_id"
  end

  create_table "trainer_clients", force: :cascade do |t|
    t.bigint "trainer_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_trainer_clients_on_client_id"
    t.index ["trainer_id", "client_id"], name: "index_trainer_clients_on_trainer_id_and_client_id", unique: true
    t.index ["trainer_id"], name: "index_trainer_clients_on_trainer_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.bigint "trainer_id", null: false
    t.string "title", null: false
    t.datetime "start_at"
    t.integer "duration_minutes"
    t.integer "capacity", null: false
    t.datetime "cancelled_at"
    t.datetime "starts_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_trainings_on_trainer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name"
    t.string "role", default: "client", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookings", "trainings"
  add_foreign_key "bookings", "users", column: "client_id"
  add_foreign_key "client_profiles", "users"
  add_foreign_key "food_entries", "users", column: "client_id"
  add_foreign_key "progress_entries", "users", column: "author_id"
  add_foreign_key "progress_entries", "users", column: "client_id"
  add_foreign_key "trainer_clients", "users", column: "client_id"
  add_foreign_key "trainer_clients", "users", column: "trainer_id"
  add_foreign_key "trainings", "users", column: "trainer_id"
end
