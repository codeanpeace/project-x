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

ActiveRecord::Schema.define(:version => 20130618185158) do

  create_table "bundles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "bundles_resources", :force => true do |t|
    t.integer "bundle_id"
    t.integer "resource_id"
  end

  create_table "bundles_standards", :force => true do |t|
    t.integer "bundle_id"
    t.integer "standard_id"
  end

  create_table "favorite_bundles", :force => true do |t|
    t.integer  "mentor_id"
    t.integer  "bundle_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favorite_bundles", ["bundle_id"], :name => "index_favorite_bundles_on_bundle_id"
  add_index "favorite_bundles", ["mentor_id"], :name => "index_favorite_bundles_on_mentor_id"

  create_table "favorite_resources", :force => true do |t|
    t.integer  "mentor_id"
    t.integer  "resource_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "favorite_resources", ["mentor_id"], :name => "index_favorite_resources_on_mentor_id"
  add_index "favorite_resources", ["resource_id"], :name => "index_favorite_resources_on_resource_id"

  create_table "grades", :force => true do |t|
    t.string   "grade"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "grades_standards", :force => true do |t|
    t.integer "grade_id"
    t.integer "standard_id"
  end

  create_table "learners", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "grade"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mentors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "kind"
    t.string   "url"
    t.string   "name"
    t.string   "source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resources_standards", :force => true do |t|
    t.integer "resource_id"
    t.integer "standard_id"
  end

  create_table "standards", :force => true do |t|
    t.string   "subject"
    t.string   "topic"
    t.string   "standard"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
