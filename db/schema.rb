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

ActiveRecord::Schema.define(version: 20170314183447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "bio"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "article_chronicles", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "chronicle_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.date     "date"
    t.string   "url"
    t.string   "pic_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chronicle_tags", force: :cascade do |t|
    t.integer  "chronicle_id"
    t.integer  "tag_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "chronicle_votes", force: :cascade do |t|
    t.integer  "chronicle_id"
    t.integer  "account_id"
    t.boolean  "upvote"
    t.boolean  "downvote"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "chronicles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "private",     default: false
    t.integer  "upvotes",     default: 0
    t.integer  "downvotes",   default: 0
    t.integer  "votes",       default: 0
    t.integer  "admin_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "account_id"
    t.integer  "chronicle_id"
    t.integer  "upvotes",      default: 0
    t.integer  "downvotes",    default: 0
    t.integer  "votes",        default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "chronicle_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
