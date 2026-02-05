# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_02_05_211601) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "inbound_attempts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "duration_ms"
    t.string "error_class"
    t.text "error_message"
    t.integer "http_status"
    t.bigint "inbound_run_id", null: false
    t.jsonb "request_summary"
    t.jsonb "response_summary"
    t.string "status"
    t.string "step"
    t.datetime "updated_at", null: false
    t.index ["inbound_run_id"], name: "index_inbound_attempts_on_inbound_run_id"
  end

  create_table "inbound_runs", force: :cascade do |t|
    t.string "correlation_id"
    t.datetime "created_at", null: false
    t.datetime "finished_at"
    t.bigint "integration_id", null: false
    t.string "mode", default: "polling", null: false
    t.datetime "started_at"
    t.jsonb "stats"
    t.string "status", default: "pending", null: false
    t.datetime "updated_at", null: false
    t.index ["correlation_id"], name: "index_inbound_runs_on_correlation_id", unique: true
    t.index ["integration_id", "started_at"], name: "index_inbound_runs_on_integration_id_and_started_at"
    t.index ["integration_id"], name: "index_inbound_runs_on_integration_id"
  end

  create_table "integrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "enabled", default: true
    t.string "name"
    t.jsonb "settings"
    t.string "source_system", null: false
    t.datetime "updated_at", null: false
    t.index ["source_system"], name: "index_integrations_on_source_system"
  end

  create_table "order_lines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "order_id", null: false
    t.integer "quantity"
    t.string "sku"
    t.string "source_external_id"
    t.string "unit_price_cents"
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_lines_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "currency_string"
    t.string "customer_email"
    t.bigint "integration_id", null: false
    t.datetime "placed_at"
    t.string "source_external_id"
    t.string "status"
    t.integer "total_amount_cents"
    t.datetime "updated_at", null: false
    t.index ["integration_id"], name: "index_orders_on_integration_id"
    t.index ["source_external_id"], name: "index_orders_on_source_external_id", unique: true
  end

  create_table "raw_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "event_type"
    t.bigint "inbound_run_id", null: false
    t.bigint "integration_id", null: false
    t.jsonb "payload"
    t.datetime "received_at"
    t.string "source_external_id"
    t.datetime "updated_at", null: false
    t.index ["inbound_run_id"], name: "index_raw_events_on_inbound_run_id"
    t.index ["integration_id", "event_type"], name: "index_raw_events_on_integration_id_and_event_type"
    t.index ["integration_id", "source_external_id"], name: "index_raw_events_on_integration_id_and_source_external_id"
    t.index ["integration_id"], name: "index_raw_events_on_integration_id"
  end

  add_foreign_key "inbound_attempts", "inbound_runs"
  add_foreign_key "inbound_runs", "integrations"
  add_foreign_key "order_lines", "orders"
  add_foreign_key "orders", "integrations"
  add_foreign_key "raw_events", "inbound_runs"
  add_foreign_key "raw_events", "integrations"
end
