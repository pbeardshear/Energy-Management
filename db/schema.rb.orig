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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20120409235441) do
=======
ActiveRecord::Schema.define(:version => 20120410044857) do
>>>>>>> upstream/master

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_tips", :force => true do |t|
<<<<<<< HEAD
    t.integer  "tip_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
=======
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tip_id"
    t.integer  "category_id"
>>>>>>> upstream/master
  end

  create_table "device_categories", :force => true do |t|
    t.integer  "setting_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "green_features", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hall_features", :force => true do |t|
    t.integer  "hall_id"
    t.integer  "green_feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "halls", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "operational_unit_id"
    t.string   "key"
  end

  create_table "operational_units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pinned_halls", :force => true do |t|
    t.integer  "setting_id"
    t.integer  "hall_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "deviceID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tips", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
