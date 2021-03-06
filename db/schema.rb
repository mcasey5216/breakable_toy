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

ActiveRecord::Schema.define(version: 20151016163529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "attachment",  null: false
    t.integer  "group_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "checkins", force: :cascade do |t|
    t.float    "latitude",   null: false
    t.float    "longitude",  null: false
    t.integer  "user_id",    null: false
    t.integer  "contact_id"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "group_id"
    t.integer  "task_id"
    t.integer  "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "group_id",     null: false
    t.string  "email",        null: false
    t.string  "company_name"
    t.string  "first_name",   null: false
    t.string  "last_name",    null: false
    t.string  "address",      null: false
    t.string  "city",         null: false
    t.string  "state",        null: false
    t.string  "zip",          null: false
    t.string  "phone"
    t.string  "phone_ext"
    t.string  "category"
    t.string  "description"
    t.float   "latitude"
    t.float   "longitude"
  end

  create_table "groups", force: :cascade do |t|
    t.string  "name"
    t.integer "primary_user_id", null: false
    t.string  "description",     null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
    t.integer "task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "group_id",                    null: false
    t.string   "title",                       null: false
    t.string   "description",                 null: false
    t.boolean  "completed",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "title"
    t.string   "address"
    t.string   "city",                                null: false
    t.string   "state",                               null: false
    t.string   "zip",                                 null: false
    t.string   "phone",                               null: false
    t.string   "profile_photo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
