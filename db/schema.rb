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

ActiveRecord::Schema.define(version: 2019_10_10_121206) do

  create_table "bikes", force: :cascade do |t|
    t.string "number", limit: 25, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_bikes_on_discarded_at"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_employees_on_discarded_at"
  end

  create_table "rides", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "bike_id", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bike_id", "start_at"], name: "index_rides_on_bike_id_and_start_at", unique: true
    t.index ["bike_id"], name: "index_rides_on_bike_id"
    t.index ["employee_id"], name: "index_rides_on_employee_id"
    t.index ["end_at"], name: "index_rides_on_end_at"
  end

end
