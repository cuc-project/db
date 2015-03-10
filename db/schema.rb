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

ActiveRecord::Schema.define(version: 20150226211147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.string   "competition"
    t.string   "tour"
    t.string   "season"
    t.string   "cup_name"
    t.string   "elitar_name"
    t.string   "level"
    t.string   "authors"
    t.string   "editors"
    t.text     "additional_info"
    t.string   "game_slug"
    t.string   "submitter"
    t.integer  "number_questions"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "questions", force: true do |t|
    t.string   "number",              null: false
    t.text     "text",                null: false
    t.text     "answer",              null: false
    t.string   "game_slug",           null: false
    t.string   "acceptance_criteria"
    t.text     "comment"
    t.text     "source"
    t.string   "authors_names"
    t.string   "team_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
  end

end
