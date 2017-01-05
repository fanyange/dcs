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

ActiveRecord::Schema.define(version: 20170105013217) do

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.string   "number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "self_number"
    t.integer  "user_id"
    t.text     "comment"
    t.index ["number"], name: "index_documents_on_number"
    t.index ["self_number"], name: "index_documents_on_self_number"
    t.index ["title"], name: "index_documents_on_title", unique: true
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "instructions", force: :cascade do |t|
    t.text     "content"
    t.date     "deadline"
    t.integer  "document_id"
    t.integer  "leader_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "leaders", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "order"
    t.text     "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "pinyin"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "leader_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_locations_on_document_id"
    t.index ["leader_id"], name: "index_locations_on_leader_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.integer  "group_id"
    t.boolean  "admin",           default: false
    t.string   "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
  end

end
