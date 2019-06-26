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

ActiveRecord::Schema.define(version: 2019_06_25_180548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "semesters", force: :cascade do |t|
    t.string "name", null: false
    t.string "credits"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_semesters_on_created_by_id"
    t.index ["name"], name: "index_semesters_on_name"
    t.index ["updated_by_id"], name: "index_semesters_on_updated_by_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age"
    t.datetime "dob"
    t.text "description"
    t.bigint "semester_id", null: false
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_students_on_created_by_id"
    t.index ["name"], name: "index_students_on_name"
    t.index ["semester_id"], name: "index_students_on_semester_id"
    t.index ["updated_by_id"], name: "index_students_on_updated_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "password_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["name"], name: "index_users_on_name"
  end

end
