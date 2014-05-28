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

ActiveRecord::Schema.define(version: 20140528145409) do

  create_table "charges", force: true do |t|
    t.decimal  "Credits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "Completedtask_id"
    t.integer  "User_id"
  end

  add_index "charges", ["Completedtask_id"], name: "index_charges_on_Completedtask_id"
  add_index "charges", ["User_id"], name: "index_charges_on_User_id"

  create_table "completedtasks", force: true do |t|
    t.decimal  "Amount"
    t.text     "Summary"
    t.datetime "TaskStart"
    t.datetime "TaskEnd"
    t.boolean  "TaskVerified"
    t.decimal  "Credits"
    t.integer  "User_id"
    t.integer  "Task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "completedtasks", ["Task_id"], name: "index_completedtasks_on_Task_id"
  add_index "completedtasks", ["User_id"], name: "index_completedtasks_on_User_id"

  create_table "settings", force: true do |t|
    t.boolean  "VerifyTaskCompleted"
    t.boolean  "VerifyCreateNewTask"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sharedappartments", force: true do |t|
    t.string   "Name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
    t.string   "password_hash"
  end

  create_table "shoutboxmessages", force: true do |t|
    t.text     "Message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "User_id"
  end

  add_index "shoutboxmessages", ["User_id"], name: "index_shoutboxmessages_on_User_id"

  create_table "tasks", force: true do |t|
    t.string   "Taskname"
    t.decimal  "CreditPerUnit"
    t.decimal  "BaseCredit"
    t.text     "Taskdescription"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "Sharedappartment_id"
  end

  add_index "tasks", ["Sharedappartment_id"], name: "index_tasks_on_Sharedappartment_id"

  create_table "userroles", force: true do |t|
    t.string   "RoleName"
    t.integer  "Priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "UserName"
    t.string   "FirstName"
    t.string   "LastName"
    t.binary   "Picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "Userrole_id"
    t.integer  "Sharedappartment_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["Sharedappartment_id"], name: "index_users_on_Sharedappartment_id"
  add_index "users", ["Userrole_id"], name: "index_users_on_Userrole_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
