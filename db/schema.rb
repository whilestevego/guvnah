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

ActiveRecord::Schema.define(version: 20150222202345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "act_summaries", force: :cascade do |t|
    t.string   "unique_id"
    t.string   "language"
    t.string   "link_to_xml"
    t.string   "link_to_html_toc"
    t.string   "title"
    t.date     "current_to_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "ripped"
    t.text     "long_title"
  end

  create_table "acts", force: :cascade do |t|
    t.string   "creator"
    t.date     "issued"
    t.date     "modified"
    t.string   "subject"
    t.text     "raw_html"
    t.text     "html"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "act_summary_id"
  end

  add_index "acts", ["act_summary_id"], name: "index_acts_on_act_summary_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "regulations", force: :cascade do |t|
    t.integer  "olid"
    t.string   "unique_id"
    t.string   "language"
    t.string   "link_to_xml"
    t.string   "link_to_html_toc"
    t.string   "title"
    t.date     "current_to_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "act_summary_id"
    t.boolean  "ripped"
  end

  add_index "regulations", ["act_summary_id"], name: "index_regulations_on_act_summary_id", using: :btree

  add_foreign_key "acts", "act_summaries"
  add_foreign_key "acts", "act_summaries"
end
