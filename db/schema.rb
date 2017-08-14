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

ActiveRecord::Schema.define(version: 20170814224336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "invoice_id"
    t.integer  "quantity"
    t.integer  "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id", using: :btree
    t.index ["item_id"], name: "index_invoice_items_on_item_id", using: :btree
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "merchant_id"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id", using: :btree
    t.index ["merchant_id"], name: "index_invoices_on_merchant_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "unit_price"
    t.integer  "merchant_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["merchant_id"], name: "index_items_on_merchant_id", using: :btree
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "invoice_id"
    t.string   "credit_card_num"
    t.date     "credit_card_expiration_date"
    t.integer  "result"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["invoice_id"], name: "index_transactions_on_invoice_id", using: :btree
  end

  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_items", "items"
  add_foreign_key "invoices", "customers"
  add_foreign_key "invoices", "merchants"
  add_foreign_key "items", "merchants"
  add_foreign_key "transactions", "invoices"
end