# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150306061052) do

  create_table "categories", force: true do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "origin_year"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_categories", force: true do |t|
    t.integer "post_id"
    t.integer "category_id"
  end

  create_table "posts", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "teams", force: true do |t|
    t.string "name"
  end

  create_table "user_clubs", force: true do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_teams", force: true do |t|
    t.integer "user_id"
    t.string  "team_id"
  end

  create_table "users", force: true do |t|
    t.string "username"
    t.string "password_digest"
    t.string "time_zone"
    t.string "slug"
    t.string "role"
  end

  create_table "votes", force: true do |t|
    t.boolean "vote"
    t.integer "user_id"
    t.string  "voteable_type"
    t.integer "voteable_id"
  end

end
