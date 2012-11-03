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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121102235318) do

  create_table "answers", :force => true do |t|
    t.date     "class_date"
    t.integer  "total_points"
    t.string   "answers"
    t.integer  "course_ID"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "course_name"
    t.integer  "instructor_ID"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "grades", :force => true do |t|
    t.string   "answers"
    t.integer  "points"
    t.integer  "total_points"
    t.date     "class_date"
    t.integer  "student_ID"
    t.integer  "course_ID"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "instructors", :force => true do |t|
    t.string   "login"
    t.string   "IP"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "instructors", ["login"], :name => "index_instructors_on_login", :unique => true
  add_index "instructors", ["remember_token"], :name => "index_instructors_on_remember_token"

  create_table "students", :force => true do |t|
    t.string   "login"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
