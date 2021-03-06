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

ActiveRecord::Schema.define(version: 20140630192014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arguments", force: true do |t|
    t.integer  "owner_id"
    t.integer  "con_side_id"
    t.text     "con_side_essay"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "outcome",        default: 0
    t.integer  "status",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "arguments", ["con_side_id"], name: "index_arguments_on_con_side_id", using: :btree
  add_index "arguments", ["owner_id"], name: "index_arguments_on_owner_id", using: :btree

  create_table "essays", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.text     "body"
    t.integer  "status",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "argument_id"
  end

  add_index "essays", ["argument_id"], name: "index_essays_on_argument_id", using: :btree
  add_index "essays", ["user_id"], name: "index_essays_on_user_id", using: :btree

  create_table "judgeships", force: true do |t|
    t.integer  "user_id"
    t.integer  "argument_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "judgeships", ["argument_id"], name: "index_judgeships_on_argument_id", using: :btree
  add_index "judgeships", ["user_id"], name: "index_judgeships_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "user_name",              default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "status",      default: 0
    t.integer  "user_id"
    t.integer  "argument_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["argument_id"], name: "index_votes_on_argument_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
