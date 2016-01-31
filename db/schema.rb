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

ActiveRecord::Schema.define(version: 20160130195520) do

  create_table "bars", force: :cascade do |t|
    t.integer  "crawl_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "longitude"
    t.string   "latitude"
    t.integer  "crawl_position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "crawls", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "user_id"
  end

  add_index "crawls", ["user_id"], name: "index_crawls_on_user_id"

  create_table "crawls_tags", force: :cascade do |t|
    t.integer "crawl_id"
    t.integer "tag_id"
  end

  add_index "crawls_tags", ["crawl_id"], name: "index_crawls_tags_on_crawl_id"
  add_index "crawls_tags", ["tag_id"], name: "index_crawls_tags_on_tag_id"

  create_table "drinks", force: :cascade do |t|
    t.integer  "bar_id"
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
