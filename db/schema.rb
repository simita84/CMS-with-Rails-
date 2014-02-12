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

ActiveRecord::Schema.define(:version => 20140209093522) do

  create_table "admins", :force => true do |t|
    t.string   "first_name",      :limit => 50, :null => false
    t.string   "last_name",       :limit => 50, :null => false
    t.string   "username",        :limit => 50, :null => false
    t.string   "emailId",                       :null => false
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "admins", ["username"], :name => "index_admins_on_username"

  create_table "contacts", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "emailid",    :null => false
    t.string   "facebook",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name",                    :limit => 150
    t.datetime "datetime",                               :null => false
    t.integer  "duration"
    t.string   "address",                 :limit => 400
    t.text     "description"
    t.string   "admin_username",                         :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "eventphoto_file_name"
    t.string   "eventphoto_content_type"
    t.integer  "eventphoto_file_size"
    t.datetime "eventphoto_updated_at"
  end

  add_index "events", ["admin_username"], :name => "index_events_on_admin_username"

  create_table "homes", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "content",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invitees", :force => true do |t|
    t.string   "email",      :limit => 100
    t.integer  "event_id",                                     :null => false
    t.string   "firstname",  :limit => 30
    t.boolean  "invited",                   :default => false
    t.boolean  "responded",                 :default => false
    t.string   "response",                  :default => "No"
    t.integer  "adults"
    t.integer  "kids"
    t.text     "message"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name",                   :limit => 100, :null => false
    t.text     "content",                               :null => false
    t.string   "posted_by",                             :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "itemphoto_file_name"
    t.string   "itemphoto_content_type"
    t.integer  "itemphoto_file_size"
    t.datetime "itemphoto_updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "username",                 :limit => 50,                    :null => false
    t.string   "first_name",               :limit => 50,                    :null => false
    t.string   "last_name",                :limit => 50,                    :null => false
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.string   "memberphoto_file_name"
    t.string   "memberphoto_content_type"
    t.integer  "memberphoto_file_size"
    t.datetime "memberphoto_updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "verified_user",                          :default => false
  end

  add_index "members", ["username"], :name => "index_members_on_username"

  create_table "products", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "title",                    :limit => 100, :null => false
    t.text     "content",                                 :null => false
    t.string   "posted_by",                               :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "recipephoto_file_name"
    t.string   "recipephoto_content_type"
    t.integer  "recipephoto_file_size"
    t.datetime "recipephoto_updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "product_id",               :null => false
    t.string   "title",                    :null => false
    t.text     "content",                  :null => false
    t.string   "posted_by",                :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "reviewphoto_file_name"
    t.string   "reviewphoto_content_type"
    t.integer  "reviewphoto_file_size"
    t.datetime "reviewphoto_updated_at"
  end

  add_index "reviews", ["product_id"], :name => "index_reviews_on_product_id"

end
