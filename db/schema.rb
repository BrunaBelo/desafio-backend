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

ActiveRecord::Schema.define(version: 2021_06_21_023131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expense_types", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "document_number"
    t.datetime "issue_date"
    t.decimal "value", precision: 9, scale: 2
    t.decimal "gloss_value", precision: 9, scale: 2
    t.decimal "net_value", precision: 9, scale: 2
    t.integer "month"
    t.integer "year"
    t.integer "installment_number"
    t.string "passenger"
    t.string "travel_part"
    t.string "lot_number"
    t.string "refund"
    t.string "restitution"
    t.string "id_documento"
    t.string "document_url"
    t.bigint "parliamentarian_id", null: false
    t.bigint "provider_id", null: false
    t.bigint "expense_type_id", null: false
    t.bigint "quota_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_type_id"], name: "index_expenses_on_expense_type_id"
    t.index ["parliamentarian_id"], name: "index_expenses_on_parliamentarian_id"
    t.index ["provider_id"], name: "index_expenses_on_provider_id"
    t.index ["quota_type_id"], name: "index_expenses_on_quota_type_id"
  end

  create_table "legislatures", force: :cascade do |t|
    t.integer "legislature_code", null: false
    t.integer "year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parliamentarians", force: :cascade do |t|
    t.string "name", null: false
    t.string "number_person_id"
    t.string "federation_unity", limit: 2, null: false
    t.string "political_party"
    t.string "card_parliamentary"
    t.integer "register_id"
    t.bigint "legislature_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["legislature_id"], name: "index_parliamentarians_on_legislature_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "number_person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quota_type_specifications", force: :cascade do |t|
    t.string "description"
    t.integer "number"
    t.bigint "quota_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quota_type_id"], name: "index_quota_type_specifications_on_quota_type_id"
  end

  create_table "quota_types", force: :cascade do |t|
    t.string "description"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "expenses", "expense_types"
  add_foreign_key "expenses", "parliamentarians"
  add_foreign_key "expenses", "providers"
  add_foreign_key "expenses", "quota_types"
  add_foreign_key "parliamentarians", "legislatures"
  add_foreign_key "quota_type_specifications", "quota_types"
end
