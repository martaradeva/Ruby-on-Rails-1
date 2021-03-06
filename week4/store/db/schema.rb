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

ActiveRecord::Schema.define(version: 20150427182510) do

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "brands_categories", force: :cascade do |t|
    t.integer  "brands_id"
    t.integer  "categories_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "brands_categories", ["brands_id"], name: "index_brands_categories_on_brands_id"
  add_index "brands_categories", ["categories_id"], name: "index_brands_categories_on_categories_id"

  create_table "categories_products", force: :cascade do |t|
    t.integer  "categories_id"
    t.integer  "products_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "categories_products", ["categories_id"], name: "index_categories_products_on_categories_id"
  add_index "categories_products", ["products_id"], name: "index_categories_products_on_products_id"

  create_table "products", force: :cascade do |t|
    t.string  "name"
    t.decimal "price"
    t.integer "quantity"
  end

end
