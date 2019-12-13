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

ActiveRecord::Schema.define(version: 20191211064329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "phone_number"
    t.string   "email"
    t.text     "note"
    t.decimal  "subtotal",       precision: 12, scale: 3
    t.decimal  "shipping",       precision: 12, scale: 3
    t.decimal  "total",          precision: 12, scale: 3
    t.integer  "payment_method"
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "order_id"
    t.datetime "expires_at"
    t.datetime "purchased_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["order_id"], name: "index_billings_on_order_id", using: :btree
    t.index ["user_id"], name: "index_billings_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "img"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_brands_on_category_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chairs", force: :cascade do |t|
    t.string  "name"
    t.integer "category_id"
    t.integer "brand_id"
    t.string  "function"
    t.string  "img"
    t.text    "description"
    t.integer "price"
    t.integer "quantity"
    t.float   "rating",      default: 0.0
    t.index ["brand_id"], name: "index_chairs_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_chairs_on_category_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "chair_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["chair_id"], name: "index_order_items_on_chair_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chair_id"
    t.float    "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommend_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "img"
    t.string   "gender"
    t.datetime "birthday"
    t.integer  "role"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "valuations", force: :cascade do |t|
    t.integer "chair_id"
    t.integer "user_id"
    t.string  "content"
  end

  add_foreign_key "billings", "orders"
  add_foreign_key "billings", "users"
  add_foreign_key "brands", "categories"
  add_foreign_key "chairs", "brands"
  add_foreign_key "chairs", "categories"
  add_foreign_key "order_items", "chairs"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
end
