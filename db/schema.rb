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

ActiveRecord::Schema.define(version: 20140510084134) do

  create_table "charges", force: true do |t|
    t.decimal  "Credits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.boolean  "VerifyTaskCompleted"
    t.boolean  "VerifyCreateNewTask"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shared_appartments", force: true do |t|
    t.string   "Name"
    t.string   "Password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoutbox_messages", force: true do |t|
    t.text     "Message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "shoutbox_messages", ["user_id"], name: "index_shoutbox_messages_on_user_id"

  create_table "task_completeds", force: true do |t|
    t.decimal  "Amount"
    t.text     "Summary"
    t.datetime "TaskStart"
    t.datetime "TaskEnd"
    t.boolean  "TaskVerified"
    t.decimal  "Credits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "Taskname"
    t.decimal  "CreditPerUnit"
    t.decimal  "BaseCredit"
    t.text     "Taskdescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", force: true do |t|
    t.string   "RoleName"
    t.integer  "Priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "UserName"
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "Password"
    t.binary   "Picture"
    t.string   "Email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
