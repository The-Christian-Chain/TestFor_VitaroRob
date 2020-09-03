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

ActiveRecord::Schema.define(version: 1) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "settings", force: :cascade do |t|
    t.string "author", default: "Parent Ministry", null: false
    t.string "ministry_name", default: "Ministry Name", null: false
    t.string "site_name", default: "Ministry Site", null: false
    t.string "keywords", default: "", null: false
    t.string "description", default: "", null: false
    t.text "motto", default: "", null: false
    t.datetime "launch_date"
    t.string "google_analytics"
    t.string "primary_color", default: "", null: false
    t.string "secondary_color", default: "", null: false
    t.string "logo", default: "", null: false
    t.string "favicon", default: "", null: false
    t.string "apple_touch", default: "", null: false
    t.string "apple_touch_152", default: "", null: false
    t.string "apple_touch_167", default: "", null: false
    t.string "apple_touch_180", default: "", null: false
    t.string "apple_touch_startup", default: "", null: false
    t.string "website", default: "", null: false
    t.string "email", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "address1", default: "", null: false
    t.string "address2", default: "", null: false
    t.string "city", default: "", null: false
    t.string "state", default: "", null: false
    t.string "zip_code", default: "", null: false
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.string "pinterest"
    t.string "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
