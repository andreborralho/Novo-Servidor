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

ActiveRecord::Schema.define(:version => 20130413200056) do

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "show_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "comments", ["show_id"], :name => "index_comments_on_show_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "flag"
  end

  create_table "days", :force => true do |t|
    t.integer  "festival_id"
    t.date     "date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.time     "opening_time"
    t.time     "closing_time"
  end

  add_index "days", ["festival_id"], :name => "index_days_on_festival_id"

  create_table "deleted_items", :force => true do |t|
    t.integer  "element"
    t.string   "table"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "festivals", :force => true do |t|
    t.string   "name"
    t.string   "coordinates"
    t.string   "logo"
    t.string   "template"
    t.string   "map"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "tickets"
    t.text     "transports"
    t.integer  "user_id"
    t.string   "city"
    t.integer  "country_id"
    t.string   "tickets_price"
  end

  add_index "festivals", ["country_id"], :name => "index_festivals_on_country_id"

  create_table "galleries", :force => true do |t|
    t.integer  "festival_id"
    t.text     "photo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "galleries", ["festival_id"], :name => "index_galleries_on_festival_id"

  create_table "notifications", :force => true do |t|
    t.integer  "festival_id"
    t.text     "text"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "show_id"
    t.string   "small"
    t.string   "large"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photos", ["show_id"], :name => "index_photos_on_band_id"

  create_table "shows", :force => true do |t|
    t.string   "name"
    t.integer  "stage_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.time     "time"
    t.integer  "day_id"
    t.integer  "festival_id"
    t.text     "description"
    t.string   "photo"
  end

  add_index "shows", ["day_id"], :name => "index_bands_on_day_id"
  add_index "shows", ["festival_id"], :name => "index_shows_on_festival_id"
  add_index "shows", ["stage_id"], :name => "index_bands_on_stage_id"

  create_table "stages", :force => true do |t|
    t.string   "name"
    t.integer  "festival_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "stages", ["festival_id"], :name => "index_stages_on_festival_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "country_id"
  end

  add_index "users", ["country_id"], :name => "index_users_on_country_id"

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "show_id"
  end

  add_index "videos", ["show_id"], :name => "index_videos_on_show_id"

end
