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

ActiveRecord::Schema.define(version: 20151116152016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bunches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "bunch_number"
    t.boolean  "in_safe"
    t.date     "received_on"
    t.text     "description"
    t.integer  "number_of_items"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "subscription_id"
  end

  add_index "bunches", ["subscription_id"], name: "index_bunches_on_subscription_id", using: :btree
  add_index "bunches", ["user_id"], name: "index_bunches_on_user_id", using: :btree

  create_table "missions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bunch_id"
    t.string   "location"
    t.datetime "meeting_at"
    t.boolean  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "missions", ["bunch_id"], name: "index_missions_on_bunch_id", using: :btree
  add_index "missions", ["user_id"], name: "index_missions_on_user_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.string   "rdv_location"
    t.datetime "rdv_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "price_cents",  default: 0, null: false
    t.string   "state"
    t.json     "payment"
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bunches", "subscriptions"
  add_foreign_key "bunches", "users"
  add_foreign_key "missions", "bunches"
  add_foreign_key "missions", "users"
  add_foreign_key "subscriptions", "users"
end
