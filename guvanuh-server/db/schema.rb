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

ActiveRecord::Schema.define(version: 20150221045056) do

  create_table "act_summaries", force: :cascade do |t|
    t.string   "unique_id"
    t.string   "language"
    t.string   "link_to_xml"
    t.string   "link_to_html_toc"
    t.string   "title"
    t.date     "current_to_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "regulations", force: :cascade do |t|
    t.integer  "olid"
    t.string   "unique_id"
    t.string   "language"
    t.string   "link_to_xml"
    t.string   "link_to_html_to_toc"
    t.string   "title"
    t.date     "current_to_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "act_summaries_id"
  end

  add_index "regulations", ["act_summaries_id"], name: "index_regulations_on_act_summaries_id"

end
