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

ActiveRecord::Schema.define(version: 2014_07_28_040201) do

  create_table "deployments", force: :cascade do |t|
    t.text "custom_payload"
    t.string "environment", default: "production"
    t.string "guid"
    t.string "name"
    t.string "name_with_owner"
    t.string "output"
    t.string "ref"
    t.string "sha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "repository_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "owner"
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
