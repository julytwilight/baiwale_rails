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

ActiveRecord::Schema.define(:version => 20130523111229) do

  create_table "discussions", :force => true do |t|
    t.string   "title",                        :null => false
    t.string   "name",                         :null => false
    t.string   "summary",      :default => ""
    t.integer  "topics_count", :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "discussions", ["name"], :name => "index_discussions_on_name", :unique => true
  add_index "discussions", ["title"], :name => "index_discussions_on_title", :unique => true

  create_table "replies", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "topic_id",   :null => false
    t.text     "post",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.integer  "discussion_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "post"
    t.integer  "views_count",         :default => 0
    t.integer  "replies_count",       :default => 0
    t.integer  "votes_count",         :default => 0
    t.integer  "points",              :default => 0, :null => false
    t.integer  "last_replay_user_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",               :limit => 90,                  :null => false
    t.string   "username",            :limit => 90,                  :null => false
    t.string   "password_digest",     :limit => 100,                 :null => false
    t.string   "localtion",           :limit => 100, :default => "", :null => false
    t.integer  "gender",                             :default => 0,  :null => false
    t.integer  "point",                              :default => 0,  :null => false
    t.integer  "state",                              :default => 1,  :null => false
    t.integer  "topics_count",                       :default => 0,  :null => false
    t.integer  "replies_count",                      :default => 0,  :null => false
    t.integer  "following",                          :default => 0,  :null => false
    t.integer  "followers",                          :default => 0,  :null => false
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "remember_token",      :limit => 25,  :default => "", :null => false
    t.datetime "last_login"
    t.integer  "admin"
    t.string   "avatar",                             :default => ""
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
