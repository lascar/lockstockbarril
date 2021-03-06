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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160328154850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street",                 default: ""
    t.string   "street_number",          default: ""
    t.string   "additional_information", default: ""
    t.string   "zipcode",                default: ""
    t.string   "town",                   default: "Madrid"
    t.string   "state",                  default: "Madrid"
    t.string   "country",                default: "España"
    t.string   "addresseable_type"
    t.integer  "addresseable_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "addresses", ["addresseable_type", "addresseable_id"], name: "index_addresses_on_addresseable_type_and_addresseable_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "reference",  default: ""
    t.integer  "brand_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "articles", ["brand_id"], name: "index_articles_on_brand_id", using: :btree
  add_index "articles", ["reference", "brand_id"], name: "index_articles_on_reference_and_brand_id", unique: true, using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "brands", ["name"], name: "index_brands_on_name", unique: true, using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "warehouse_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "locations", ["name", "warehouse_id"], name: "index_locations_on_name_and_warehouse_id", unique: true, using: :btree
  add_index "locations", ["warehouse_id"], name: "index_locations_on_warehouse_id", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplies", force: :cascade do |t|
    t.string   "ref_supplier", default: ""
    t.integer  "article_id"
    t.integer  "supplier_id"
    t.integer  "price"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "supplies", ["article_id"], name: "index_supplies_on_article_id", using: :btree
  add_index "supplies", ["ref_supplier", "supplier_id"], name: "index_supplies_on_ref_supplier_and_supplier_id", unique: true, using: :btree
  add_index "supplies", ["supplier_id"], name: "index_supplies_on_supplier_id", using: :btree

  create_table "supplies_in_warehouse", force: :cascade do |t|
    t.integer  "article_id",        null: false
    t.integer  "supply_id",         null: false
    t.integer  "location_id"
    t.integer  "warehouse_id",      null: false
    t.integer  "bought_price_unit"
    t.integer  "quantity"
    t.date     "bought_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "supplies_in_warehouse", ["article_id"], name: "index_supplies_in_warehouse_on_article_id", using: :btree
  add_index "supplies_in_warehouse", ["location_id"], name: "index_supplies_in_warehouse_on_location_id", using: :btree
  add_index "supplies_in_warehouse", ["supply_id"], name: "index_supplies_in_warehouse_on_supply_id", using: :btree
  add_index "supplies_in_warehouse", ["warehouse_id"], name: "index_supplies_in_warehouse_on_warehouse_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                   null: false
    t.string   "name",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "warehouses", force: :cascade do |t|
    t.string   "name",       default: ""
    t.integer  "capacity",   default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "articles", "brands"
  add_foreign_key "locations", "warehouses"
  add_foreign_key "supplies", "articles"
  add_foreign_key "supplies", "suppliers"
  add_foreign_key "supplies_in_warehouse", "articles"
  add_foreign_key "supplies_in_warehouse", "locations"
  add_foreign_key "supplies_in_warehouse", "supplies"
  add_foreign_key "supplies_in_warehouse", "warehouses"
end
