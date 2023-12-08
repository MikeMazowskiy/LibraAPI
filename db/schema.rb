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

ActiveRecord::Schema[7.0].define(version: 2023_11_09_191217) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.integer "pages"
    t.integer "year_of_publishing"
    t.uuid "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "list_id"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["list_id"], name: "index_books_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.uuid "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_lists_on_profile_id"
  end

  create_table "lists_books", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "list_id"], name: "index_lists_books_on_book_id_and_list_id", unique: true
    t.index ["book_id"], name: "index_lists_books_on_book_id"
    t.index ["list_id"], name: "index_lists_books_on_list_id"
  end

  create_table "profiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nick_name"
    t.string "full_name"
    t.integer "age"
    t.uuid "user_id", null: false
    t.boolean "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "text"
    t.uuid "profile_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["profile_id"], name: "index_reviews_on_profile_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "lists"
  add_foreign_key "books", "profiles", column: "author_id"
  add_foreign_key "lists", "profiles"
  add_foreign_key "lists_books", "books"
  add_foreign_key "lists_books", "lists"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "profiles"
end
