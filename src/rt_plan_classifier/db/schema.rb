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

ActiveRecord::Schema.define(version: 2019_09_19_060031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "canonical_plans", force: :cascade do |t|
    t.string "plan_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_name"], name: "index_canonical_plans_on_plan_name"
  end

  create_table "equivocal_plans", force: :cascade do |t|
    t.string "plan_name"
    t.bigint "canonical_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["canonical_plan_id"], name: "index_equivocal_plans_on_canonical_plan_id"
    t.index ["plan_name"], name: "index_equivocal_plans_on_plan_name"
  end

  add_foreign_key "equivocal_plans", "canonical_plans"
end
