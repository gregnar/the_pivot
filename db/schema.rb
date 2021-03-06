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

ActiveRecord::Schema.define(version: 20150107224803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "street_name"
    t.string   "street_number"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "supplier_id"
  end

  create_table "addresses_users", id: false, force: true do |t|
    t.integer "address_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "addresses_users", ["address_id", "user_id"], name: "index_addresses_users_on_address_id_and_user_id", using: :btree
  add_index "addresses_users", ["user_id", "address_id"], name: "index_addresses_users_on_user_id_and_address_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
  end

  create_table "categories_items", id: false, force: true do |t|
    t.integer "category_id", null: false
    t.integer "item_id",     null: false
  end

  add_index "categories_items", ["category_id", "item_id"], name: "index_categories_items_on_category_id_and_item_id", using: :btree
  add_index "categories_items", ["item_id", "category_id"], name: "index_categories_items_on_item_id_and_category_id", using: :btree

  create_table "coordinates", force: true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fillings", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price",              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "food_group"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "retired",            default: false
  end

  create_table "item_fillings", force: true do |t|
    t.integer  "item_id"
    t.integer  "filling_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_fillings", ["filling_id"], name: "index_item_fillings_on_filling_id", using: :btree
  add_index "item_fillings", ["item_id"], name: "index_item_fillings_on_item_id", using: :btree

  create_table "item_orders", id: false, force: true do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "quantity"
  end

  add_index "item_orders", ["item_id", "order_id"], name: "index_item_orders_on_item_id_and_order_id", using: :btree
  add_index "item_orders", ["order_id", "item_id"], name: "index_item_orders_on_order_id_and_item_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "active",             default: true
    t.integer  "supplier_id"
    t.integer  "unit_weight"
    t.integer  "unit_size"
    t.integer  "quantity_available"
  end

  create_table "items_orders", id: false, force: true do |t|
    t.integer "order_id", null: false
    t.integer "item_id",  null: false
    t.integer "quantity"
  end

  add_index "items_orders", ["item_id", "order_id"], name: "index_items_orders_on_item_id_and_order_id", using: :btree
  add_index "items_orders", ["order_id", "item_id"], name: "index_items_orders_on_order_id_and_item_id", using: :btree

  create_table "line_item_fillings", force: true do |t|
    t.integer  "line_item_id"
    t.integer  "filling_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "pending",       default: true
    t.integer  "coordinate_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supplier_users", id: false, force: true do |t|
    t.integer "user_id",     null: false
    t.integer "supplier_id", null: false
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "description"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.text     "website"
  end

  create_table "suppliers_users", id: false, force: true do |t|
    t.integer "user_id",     null: false
    t.integer "supplier_id", null: false
  end

  create_table "user_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "display_name"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "email_confirmed"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
