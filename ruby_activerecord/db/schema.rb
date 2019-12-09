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

ActiveRecord::Schema.define(version: 2019_12_08_162041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "rate"
    t.string "comment"
    t.string "username"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_feedbacks_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.bigint "shop_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "products_tags", id: false, force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "tag_id"
    t.index ["product_id"], name: "index_products_tags_on_product_id"
    t.index ["tag_id"], name: "index_products_tags_on_tag_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "comment"
    t.string "username"
    t.boolean "is_open"
    t.string "admin_answer"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_questions_on_product_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "domain"
    t.string "name"
    t.string "address"
    t.boolean "is_open"
    t.integer "staff_count"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
  end

end
