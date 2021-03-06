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

ActiveRecord::Schema.define(version: 20180312005915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchange_rates", force: :cascade do |t|
    t.string "base_currency", limit: 3, null: false
    t.string "target_currency", limit: 3, null: false
    t.date "date", null: false
    t.decimal "rate", null: false
    t.decimal "prediction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "base_currency", "target_currency"], name: "rates_multicolumn_index"
  end

  create_table "exchange_rates_reports", id: false, force: :cascade do |t|
    t.bigint "exchange_rate_id", null: false
    t.bigint "exchange_report_id", null: false
    t.index ["exchange_rate_id"], name: "index_exchange_rates_reports_on_exchange_rate_id"
    t.index ["exchange_report_id"], name: "index_exchange_rates_reports_on_exchange_report_id"
  end

  create_table "exchange_reports", force: :cascade do |t|
    t.string "base_currency", limit: 3, null: false
    t.string "target_currency", limit: 3, null: false
    t.decimal "amount", null: false
    t.integer "max_wait_time_in_weeks", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "future_dates", default: [], array: true
    t.integer "best_weeks_ids", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
