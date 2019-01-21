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

ActiveRecord::Schema.define(version: 2019_01_19_200000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_works", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "promotion_id"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_artist_works_on_promotion_id"
    t.index ["user_id"], name: "index_artist_works_on_user_id"
  end

  create_table "business_hours", force: :cascade do |t|
    t.bigint "business_id"
    t.integer "day"
    t.time "open_time"
    t.time "close_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_hours_on_business_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "phone"
    t.integer "zipcode"
    t.string "email"
    t.string "facebook"
    t.string "instagram"
    t.string "youtube"
    t.string "twitter"
    t.string "logo"
    t.string "hashtag"
    t.string "bio"
    t.string "operator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landings", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.string "title"
    t.string "artwork"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "email", null: false
    t.date "birthday"
    t.string "phone_number"
    t.integer "role", default: 0
    t.bigint "title_id"
    t.string "instagram"
    t.string "facebook"
    t.string "linkedin"
    t.string "avatar"
    t.string "hashtag"
    t.text "bio"
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
    t.index ["title_id"], name: "index_users_on_title_id"
  end

  add_foreign_key "business_hours", "businesses"
  add_foreign_key "users", "titles"
end
