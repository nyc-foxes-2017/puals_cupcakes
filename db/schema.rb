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

ActiveRecord::Schema.define(version: 20170329144536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backlogs", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_backlogs_on_movie_id", using: :btree
    t.index ["user_id"], name: "index_backlogs_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_comments_on_movie_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_favorites_on_movie_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "year"
    t.string   "age_rating"
    t.integer  "duration"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "body"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "user_name",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "backlogs", "movies"
  add_foreign_key "backlogs", "users"
  add_foreign_key "comments", "movies"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "movies"
  add_foreign_key "favorites", "users"
  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
end