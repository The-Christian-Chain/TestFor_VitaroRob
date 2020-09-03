ActiveRecord::Schema.define(version: 2020_08_31_154958) do

  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "unconfirmed_email"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "member_id"
    t.string "provider", default: "tcc", null: false
    t.bigint "universal_id", default: 0, null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "user_name"
    t.string "gender"
    t.string "avatar"
    t.string "avatar_main"
    t.string "avatar_thumb"
    t.string "avatar_nav"
    t.date "birthday"
    t.string "phone"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.float "long"
    t.float "lat"
    t.string "tcc_profile", default: "", null: false
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.string "pinterest"
    t.string "linkedin"
    t.text "motto"
    t.integer "reg_step", default: 1, null: false
    t.integer "security", default: 0, null: false
    t.boolean "user_name_created", default: false, null: false
    t.boolean "published", default: false, null: false
    t.boolean "deactivated", default: false, null: false
    t.datetime "tcc_created"
    t.datetime "tcc_updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_profiles_on_member_id"
    t.index ["provider"], name: "index_profiles_on_provider"
    t.index ["universal_id"], name: "index_profiles_on_universal_id", unique: true
    t.index ["user_name"], name: "index_profiles_on_user_name", unique: true
  end

  add_foreign_key "profiles", "members"
end
