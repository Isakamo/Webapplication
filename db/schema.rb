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

ActiveRecord::Schema.define(version: 2018_07_22_070938) do

  create_table "boards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "user_id"
    t.boolean "is_delete", default: false, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "responses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "thre_id"
    t.string "content", default: "", null: false
    t.bigint "user_id"
    t.bigint "response_id"
    t.bigint "up_file_id"
    t.boolean "is_delete", default: false, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["response_id"], name: "index_responses_on_response_id"
    t.index ["thre_id"], name: "index_responses_on_thre_id"
    t.index ["up_file_id"], name: "index_responses_on_up_file_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "thres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "user_id"
    t.bigint "board_id"
    t.boolean "is_delete", default: false, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["board_id"], name: "index_thres_on_board_id"
    t.index ["user_id"], name: "index_thres_on_user_id"
  end

  create_table "up_files", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "thre_id"
    t.string "format"
    t.bigint "user_id"
    t.boolean "is_delete", default: false, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["thre_id"], name: "index_up_files_on_thre_id"
    t.index ["user_id"], name: "index_up_files_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "anonymous", null: false
    t.boolean "is_delete", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boards", "users"
  add_foreign_key "responses", "responses"
  add_foreign_key "responses", "thres"
  add_foreign_key "responses", "up_files"
  add_foreign_key "responses", "users"
  add_foreign_key "thres", "boards"
  add_foreign_key "thres", "users"
  add_foreign_key "up_files", "thres"
  add_foreign_key "up_files", "users"
end
