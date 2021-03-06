# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090512011050) do

  create_table "ads", :force => true do |t|
    t.integer  "contract_id"
    t.integer  "adsize_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adsizes", :force => true do |t|
    t.string   "adsize"
    t.integer  "numlistings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "standardprice"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "long_description"
  end

  create_table "charges", :force => true do |t|
    t.integer  "contract_id"
    t.decimal  "amount"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "business"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "contract_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", :force => true do |t|
    t.datetime "contractdate"
    t.integer  "client_id"
    t.integer  "salesperson_id"
    t.integer  "designer_id"
    t.boolean  "clientapproved"
    t.boolean  "certlistedoncontract"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id"
    t.datetime "paymentduedate"
  end

  create_table "designers", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "whoby"
    t.string   "email"
    t.datetime "start"
    t.datetime "end"
    t.integer  "region_id"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contract_id"
    t.string   "website"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "contract_id"
    t.decimal  "amount"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salespeople", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.integer  "numberofads"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "long_description"
  end

  create_table "uploads", :force => true do |t|
    t.integer  "contract_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "subcategory_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "salesperson_id"
  end

  create_table "web_ads", :force => true do |t|
    t.string   "name"
    t.string   "kindof"
    t.datetime "startdate"
    t.datetime "enddate"
    t.text     "content"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
