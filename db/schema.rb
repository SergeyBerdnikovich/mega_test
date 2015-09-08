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

ActiveRecord::Schema.define(version: 20150907133139) do

  create_table "test_entities", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0
    t.datetime "current_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.integer  "failed_attempts",        limit: 4,     default: 0
    t.datetime "locked_at"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.text     "description",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
