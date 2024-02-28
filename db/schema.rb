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

ActiveRecord::Schema.define(version: 2024_02_23_044428) do

  create_table "favorites", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "product_id"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["shop_id"], name: "index_favorites_on_shop_id"
    t.index ["user_id", "product_id"], name: "index_favorites_on_user_id_and_product_id", unique: true
    t.index ["user_id", "shop_id"], name: "index_favorites_on_user_id_and_shop_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "shops"
  add_foreign_key "favorites", "users"
  add_foreign_key "products", "shops"
end
