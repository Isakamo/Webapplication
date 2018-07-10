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

ActiveRecord::Schema.define(version: 2018_07_09_173726) do

  create_table "boards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "responses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "thre_id"
    t.string "content"
    t.bigint "user_id"
    t.bigint "response_id"
    t.bigint "up_file_id"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_responses_on_response_id"
    t.index ["thre_id"], name: "index_responses_on_thre_id"
    t.index ["up_file_id"], name: "index_responses_on_up_file_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "thres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "board_id"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_thres_on_board_id"
    t.index ["user_id"], name: "index_thres_on_user_id"
  end

  create_table "up_files", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "thre_id"
    t.string "format"
    t.bigint "user_id"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thre_id"], name: "index_up_files_on_thre_id"
    t.index ["user_id"], name: "index_up_files_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.boolean "is_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
