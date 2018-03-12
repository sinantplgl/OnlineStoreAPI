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

ActiveRecord::Schema.define(version: 0) do

  create_table "categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 20
  end

  create_table "customers", primary_key: "user_id", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "home_address", limit: 140
    t.integer "tax_id"
  end

  create_table "delivery_lists", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.boolean "is_delivered"
    t.index ["order_id"], name: "order_id"
    t.index ["product_id"], name: "product_id"
  end

  create_table "invoices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "order_id"
    t.date "idate"
    t.index ["order_id"], name: "order_id"
  end

  create_table "orders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "invoice_id", null: false
    t.string "delivery_address", limit: 140
    t.float "total_price", limit: 53
    t.index ["customer_id"], name: "customer_id"
    t.index ["invoice_id"], name: "invoice_id"
  end

  create_table "product_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "category_id"
    t.index ["product_id"], name: "product_id"
  end

  create_table "product_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.string "action", limit: 100
    t.index ["product_id"], name: "product_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "product_managers", primary_key: "user_id", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
  end

  create_table "products", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description", limit: 1000
    t.string "dist_info", limit: 200
    t.string "warranty_status", limit: 50
    t.integer "model_number"
    t.float "price", limit: 53
    t.float "discount", limit: 53
    t.integer "stock_quantity"
  end

  create_table "sales_managers", primary_key: "user_id", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 30
    t.string "email", limit: 30
    t.string "password_digest", limit: 100
  end

  add_foreign_key "customers", "users", name: "customers_ibfk_1", on_delete: :cascade
  add_foreign_key "delivery_lists", "orders", name: "delivery_lists_ibfk_2", on_delete: :cascade
  add_foreign_key "delivery_lists", "products", name: "delivery_lists_ibfk_1", on_delete: :cascade
  add_foreign_key "invoices", "orders", name: "invoices_ibfk_1", on_delete: :cascade
  add_foreign_key "orders", "customers", primary_key: "user_id", name: "orders_ibfk_1"
  add_foreign_key "orders", "invoices", name: "orders_ibfk_2"
  add_foreign_key "product_categories", "categories", name: "product_categories_ibfk_2", on_delete: :cascade
  add_foreign_key "product_categories", "products", name: "product_categories_ibfk_1", on_delete: :cascade
  add_foreign_key "product_logs", "products", name: "product_logs_ibfk_1"
  add_foreign_key "product_logs", "users", name: "product_logs_ibfk_2"
  add_foreign_key "product_managers", "users", name: "product_managers_ibfk_1", on_delete: :cascade
  add_foreign_key "sales_managers", "users", name: "sales_managers_ibfk_1", on_delete: :cascade
end
