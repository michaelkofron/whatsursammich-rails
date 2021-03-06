# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_21_184311) do

  create_table "reviews", force: :cascade do |t|
    t.string "body"
    t.integer "rating"
    t.integer "user_id"
    t.integer "sam_id"
  end

  create_table "rpoints", force: :cascade do |t|
    t.integer "review_id"
    t.integer "user_id"
    t.integer "value"
  end

  create_table "sams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spoints", force: :cascade do |t|
    t.integer "sam_id"
    t.integer "user_id"
    t.integer "value"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "uid"
    t.string "provider"
  end

end
