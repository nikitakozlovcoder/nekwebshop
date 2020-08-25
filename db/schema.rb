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

ActiveRecord::Schema.define(version: 2020_08_24_143019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "street"
    t.string "state"
    t.string "country"
    t.string "zip"
    t.string "suburb"
    t.string "county"
    t.integer "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attributes", force: :cascade do |t|
    t.string "name"
    t.string "text"
    t.float "num"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "check"
    t.string "type_name"
    t.string "hint"
    t.integer "code"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.integer "quantity"
    t.string "uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "data"
    t.string "ancestry"
    t.boolean "is_template", default: false
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "categories_makers", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "maker_id"
    t.index ["category_id"], name: "index_categories_makers_on_category_id"
    t.index ["maker_id"], name: "index_categories_makers_on_maker_id"
  end

  create_table "makers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_another"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.text "body"
    t.integer "mark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_posts_on_ancestry"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.string "maker_name"
    t.boolean "custom_maker"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.integer "maker_id"
    t.integer "shop_id"
    t.text "description"
    t.integer "quantity"
    t.boolean "is_inf_quantity"
    t.float "mark", default: 0.0
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "top_cat", default: "[]"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.string "name"
    t.string "surname"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "restore_date"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "zip"
    t.string "suburb"
    t.string "county"
    t.string "restore_code"
    t.datetime "restore_code_task_started"
    t.boolean "confirmed"
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
