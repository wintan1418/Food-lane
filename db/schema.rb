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

ActiveRecord::Schema[7.2].define(version: 2024_08_30_004225) do
  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_comments_on_meal_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "quantity"
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_ingredients_on_meal_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.integer "user_id", null: false
    t.integer "timetable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timetable_id"], name: "index_invitations_on_timetable_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.text "recipe"
    t.integer "timetable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timetable_id"], name: "index_meals_on_timetable_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "value"
    t.integer "user_id", null: false
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_ratings_on_meal_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.date "start_date"
    t.date "end_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timetable_type"
    t.index ["user_id"], name: "index_timetables_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "meals"
  add_foreign_key "comments", "users"
  add_foreign_key "ingredients", "meals"
  add_foreign_key "invitations", "timetables"
  add_foreign_key "invitations", "users"
  add_foreign_key "meals", "timetables"
  add_foreign_key "ratings", "meals"
  add_foreign_key "ratings", "users"
  add_foreign_key "timetables", "users"
end
