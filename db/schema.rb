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

ActiveRecord::Schema.define(version: 2021_01_20_041707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forecasts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.string "forecast_type"
    t.datetime "datetime"
    t.datetime "sunrise"
    t.datetime "sunset"
    t.float "temperature"
    t.float "feels_like"
    t.integer "humidity"
    t.integer "uvi"
    t.integer "visibility"
    t.string "conditions"
    t.string "icon"
    t.float "max_temp"
    t.float "min_temp"
    t.string "wind_speed"
    t.string "wind_direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "forecast_id"
    t.index ["forecast_id"], name: "index_weathers_on_forecast_id"
  end

end
