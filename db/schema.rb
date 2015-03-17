# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150312235128) do

  create_table "activity_types", force: true do |t|
    t.string   "spin"
    t.string   "strength_training"
    t.string   "barre"
    t.string   "yoga"
    t.string   "dance"
    t.string   "pilates"
    t.string   "other"
    t.integer  "studio_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "studio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estimates", force: true do |t|
    t.string   "studio_name"
    t.string   "studio_hq_city"
    t.string   "studio_activities"
    t.string   "employee_name"
    t.string   "employee_position"
    t.integer  "fc_sum"
    t.integer  "security_deposit"
    t.integer  "construction_cost"
    t.integer  "training_equipment_cost"
    t.integer  "av_equipment_cost"
    t.integer  "architect_cost"
    t.integer  "oc_sum"
    t.integer  "avg_instructor_per_class_pay"
    t.integer  "avg_monthly_classes"
    t.integer  "front_desk_hourly_pay"
    t.integer  "avg_monthly_front_desk_hours"
    t.integer  "monthly_rent"
    t.integer  "laundry_service_monthly_cost"
    t.integer  "cleaning_service_monthly_cost"
    t.integer  "accountant_and_payroll_monthly_pay"
    t.integer  "employee_monthly_salary"
    t.integer  "salaried_employees_count"
    t.integer  "other_operating_costs"
    t.integer  "fixed_cost_id"
    t.integer  "operating_cost_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "fixed_costs", force: true do |t|
    t.integer  "security_deposit"
    t.integer  "construction_cost"
    t.integer  "training_equipment_cost"
    t.integer  "av_equipment_cost"
    t.integer  "architect_cost"
    t.integer  "employee_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "operating_costs", force: true do |t|
    t.integer  "avg_instructor_per_class_pay"
    t.integer  "avg_monthly_classes"
    t.integer  "front_desk_hourly_pay"
    t.integer  "avg_monthly_front_desk_hours"
    t.integer  "monthly_rent"
    t.integer  "laundry_service_monthly_cost"
    t.integer  "cleaning_service_monthly_cost"
    t.integer  "accountant_and_payroll_monthly_pay"
    t.integer  "employee_monthly_salary"
    t.integer  "salaried_employees_count"
    t.integer  "other_operating_costs"
    t.integer  "employee_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "studios", force: true do |t|
    t.string   "name"
    t.string   "hq_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
