# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101208201345) do

  create_table "categories", :force => true do |t|
    t.string "name"
    t.string "parent"
  end

  create_table "housing_images", :force => true do |t|
    t.string   "caption"
    t.integer  "housing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  create_table "housings", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "address"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "optional_address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "state"
  end

  create_table "listing_images", :force => true do |t|
    t.string   "caption"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  create_table "listings", :force => true do |t|
    t.string   "author"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "price"
    t.integer  "user_id"
  end

  create_table "notifiers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.float    "amount"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staticpages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                   :null => false
    t.string   "crypted_password",                        :null => false
    t.string   "password_salt",                           :null => false
    t.string   "persistence_token",                       :null => false
    t.string   "single_access_token",                     :null => false
    t.string   "perishable_token",                        :null => false
    t.integer  "login_count",         :default => 0,      :null => false
    t.integer  "failed_login_count",  :default => 0,      :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "active",              :default => false,  :null => false
    t.string   "alias"
    t.string   "activation_code"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.string   "user_role",           :default => "user"
    t.boolean  "email_is_public",     :default => true
    t.boolean  "is_student",          :default => false
    t.boolean  "can_post",            :default => false
  end

end
