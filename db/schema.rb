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

ActiveRecord::Schema.define(version: 20170428155146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: :cascade do |t|
    t.string   "from_name"
    t.string   "from_email"
    t.string   "to_name"
    t.string   "to_email"
    t.string   "message"
    t.datetime "sent_at"
    t.datetime "failed_at"
    t.integer  "attempt_count"
    t.integer  "epostcard_id"
    t.integer  "lodging_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "opt_in"
    t.string   "send_token"
    t.index ["epostcard_id"], name: "index_emails_on_epostcard_id", using: :btree
    t.index ["lodging_id"], name: "index_emails_on_lodging_id", using: :btree
  end

  create_table "epostcards", force: :cascade do |t|
    t.text     "name"
    t.text     "main_image"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_epostcards_on_page_id", using: :btree
  end

  create_table "lodgings", force: :cascade do |t|
    t.string   "destination_ref"
    t.string   "region_ref"
    t.string   "company_name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "reservation"
    t.string   "fax"
    t.string   "url"
    t.string   "contact"
    t.string   "season"
    t.string   "email"
    t.string   "details"
    t.string   "mask2id_ref"
    t.string   "customer_status_notes"
    t.datetime "expires_at"
    t.datetime "paid_at"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_lodgings_on_user_id", using: :btree
  end

  create_table "pages", force: :cascade do |t|
    t.string   "content_header"
    t.string   "content_one"
    t.string   "content_two"
    t.string   "page_type",      default: "e-postcard"
    t.boolean  "active"
    t.integer  "lodging_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["lodging_id"], name: "index_pages_on_lodging_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "emails", "epostcards"
  add_foreign_key "emails", "lodgings"
  add_foreign_key "epostcards", "pages"
  add_foreign_key "pages", "lodgings"
end
