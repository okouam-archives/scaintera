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

ActiveRecord::Schema.define(:version => 20120111150046) do

  create_table "beneficiaries", :force => true do |t|
    t.string   "category"
    t.integer  "policy_holder_id", :null => false
    t.string   "relationship"
    t.string   "names"
    t.string   "surname"
    t.string   "telephone"
    t.datetime "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "policy_holders", :force => true do |t|
    t.string   "names"
    t.string   "surname"
    t.string   "nationality"
    t.string   "gender"
    t.string   "status"
    t.integer  "user_id"
    t.string   "payment_type"
    t.string   "address"
    t.string   "city"
    t.string   "postcode"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.datetime "dob"
    t.string   "email"
    t.boolean  "rents_property"
    t.boolean  "owns_property"
    t.boolean  "uses_money_transfers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "cover",            :null => false
    t.datetime "expiry_date"
    t.decimal  "premium_amount"
    t.integer  "policy_holder_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login",             :null => false
    t.string   "email",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token", :null => false
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.string   "role"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
