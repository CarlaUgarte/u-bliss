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

ActiveRecord::Schema[7.1].define(version: 2024_12_09_213627) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "lecture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_comments_on_lecture_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.text "details"
    t.bigint "syllabus_module_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["syllabus_module_id"], name: "index_lectures_on_syllabus_module_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "syllabus_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["syllabus_id"], name: "index_libraries_on_syllabus_id"
    t.index ["user_id"], name: "index_libraries_on_user_id"
  end

  create_table "syllabus_modules", force: :cascade do |t|
    t.string "name"
    t.bigint "syllabus_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["syllabus_id"], name: "index_syllabus_modules_on_syllabus_id"
  end

  create_table "syllabuses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_syllabuses_on_category_id"
    t.index ["user_id"], name: "index_syllabuses_on_user_id"
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

  add_foreign_key "comments", "lectures"
  add_foreign_key "comments", "users"
  add_foreign_key "lectures", "syllabus_modules"
  add_foreign_key "libraries", "syllabuses"
  add_foreign_key "libraries", "users"
  add_foreign_key "syllabus_modules", "syllabuses"
  add_foreign_key "syllabuses", "categories"
  add_foreign_key "syllabuses", "users"
end
