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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130625150902) do

  create_table "feedback", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "author_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
  end

  create_table "meta_feedback", :force => true do |t|
    t.integer  "author_id"
    t.integer  "feedback_id"
    t.integer  "kindness_score"
    t.integer  "actionability_score"
    t.integer  "specificity_score"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",         :default => "", :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.text     "image_url"
    t.string   "uid"
    t.string   "oauth2_token"
    t.string   "refresh_token"
    t.integer  "coach_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
