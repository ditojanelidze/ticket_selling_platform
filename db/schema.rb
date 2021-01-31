# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_31_160407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_statuses", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "id_name", limit: 50, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "booking_status_id"
    t.bigint "ticket_id"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_status_id"], name: "index_bookings_on_booking_status_id"
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["ticket_id"], name: "index_bookings_on_ticket_id"
  end

  create_table "event_settings", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "ticket_selling_type_id", null: false
    t.integer "rows_count", null: false
    t.integer "seats_per_row", null: false
    t.index ["event_id"], name: "index_event_settings_on_event_id"
    t.index ["ticket_selling_type_id"], name: "index_event_settings_on_ticket_selling_type_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "description", null: false
  end

  create_table "ticket_selling_types", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "id_name", limit: 50, null: false
  end

  create_table "ticket_statuses", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "id_name", limit: 50, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "ticket_status_id", null: false
    t.integer "seat_number", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["ticket_status_id"], name: "index_tickets_on_ticket_status_id"
  end

  add_foreign_key "bookings", "booking_statuses"
  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "tickets"
  add_foreign_key "event_settings", "events"
  add_foreign_key "event_settings", "ticket_selling_types"
  add_foreign_key "tickets", "events"
  add_foreign_key "tickets", "ticket_statuses"
end
