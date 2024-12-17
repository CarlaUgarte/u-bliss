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

ActiveRecord::Schema[7.1].define(version: 2024_12_17_205724) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "achieved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "syllabus_id", null: false
    t.index ["syllabus_id"], name: "index_reviews_on_syllabus_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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

  create_table "user_points", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_points_on_user_id"
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

  add_foreign_key "achievements", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "lectures"
  add_foreign_key "comments", "users"
  add_foreign_key "lectures", "syllabus_modules"
  add_foreign_key "libraries", "syllabuses"
  add_foreign_key "libraries", "users"
  add_foreign_key "reviews", "syllabuses"
  add_foreign_key "reviews", "users"
  add_foreign_key "syllabus_modules", "syllabuses"
  add_foreign_key "syllabuses", "categories"
  add_foreign_key "syllabuses", "users"
  add_foreign_key "user_points", "users"
end
