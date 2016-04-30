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

ActiveRecord::Schema.define(version: 20160423114053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "order_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "pages_category_id"
    t.string   "seo_title"
    t.text     "seo_description"
    t.boolean  "active",            default: true
  end

  create_table "pages_categories", force: :cascade do |t|
    t.string  "title"
    t.integer "parent_id"
    t.integer "lft",                        null: false
    t.integer "rgt",                        null: false
    t.integer "depth",          default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.string  "slug"
  end

  add_index "pages_categories", ["lft"], name: "index_pages_categories_on_lft", using: :btree
  add_index "pages_categories", ["parent_id"], name: "index_pages_categories_on_parent_id", using: :btree
  add_index "pages_categories", ["rgt"], name: "index_pages_categories_on_rgt", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",                precision: 8, scale: 2
    t.integer  "products_category_id"
    t.string   "cover"
    t.boolean  "active",                                       default: true
    t.string   "slug"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.decimal  "length",               precision: 8, scale: 2
    t.decimal  "height",               precision: 8, scale: 2
    t.decimal  "width",                precision: 8, scale: 2
    t.decimal  "weight",               precision: 8, scale: 2
    t.string   "brand"
    t.string   "seo_title"
    t.string   "seo_description"
  end

  create_table "products_categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "slug"
    t.string   "cover"
    t.boolean  "active",          default: true
    t.integer  "parent_id"
    t.integer  "lft",                            null: false
    t.integer  "rgt",                            null: false
    t.integer  "depth",           default: 0,    null: false
    t.integer  "children_count",  default: 0,    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "seo_title"
    t.string   "seo_description"
  end

  add_index "products_categories", ["lft"], name: "index_products_categories_on_lft", using: :btree
  add_index "products_categories", ["parent_id"], name: "index_products_categories_on_parent_id", using: :btree
  add_index "products_categories", ["rgt"], name: "index_products_categories_on_rgt", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

end
