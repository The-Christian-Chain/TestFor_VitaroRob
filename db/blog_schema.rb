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

ActiveRecord::Schema.define(version: 2020_08_31_224948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.boolean "has_sections", default: false, null: false
    t.boolean "has_subscription", default: false, null: false
    t.boolean "visible", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_blogs_on_name", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description", null: false
    t.boolean "primary", default: false, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "category_maps", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_maps_on_category_id"
    t.index ["post_id"], name: "index_category_maps_on_post_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "post_id", null: false
    t.integer "comment_id"
    t.text "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_comments_on_member_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "title", null: false
    t.string "slug", null: false
    t.string "image"
    t.string "location"
    t.text "content", null: false
    t.integer "status", default: 1, null: false
    t.integer "visibility", default: 1, null: false
    t.string "password"
    t.boolean "allow_comments", default: true, null: false
    t.boolean "archived", default: false, null: false
    t.boolean "hidden", default: false, null: false
    t.boolean "subscription", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at", precision: 6
    t.index ["member_id"], name: "index_posts_on_member_id"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "section_blog_maps", force: :cascade do |t|
    t.integer "section_id", null: false
    t.integer "blog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_id"], name: "index_section_blog_maps_on_blog_id"
    t.index ["section_id"], name: "index_section_blog_maps_on_section_id"
  end

  create_table "section_post_maps", force: :cascade do |t|
    t.integer "section_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_section_post_maps_on_post_id"
    t.index ["section_id"], name: "index_section_post_maps_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description", default: "No description give.", null: false
    t.boolean "primary", default: false, null: false
    t.boolean "active", default: true, null: false
    t.integer "order", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_sections_on_name", unique: true
  end

  create_table "tag_maps", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_tag_maps_on_post_id"
    t.index ["tag_id"], name: "index_tag_maps_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  add_foreign_key "category_maps", "categories"
  add_foreign_key "category_maps", "posts"
  add_foreign_key "comments", "comments"
  add_foreign_key "comments", "posts"
  add_foreign_key "section_blog_maps", "blogs"
  add_foreign_key "section_blog_maps", "sections"
  add_foreign_key "section_post_maps", "posts"
  add_foreign_key "section_post_maps", "sections"
  add_foreign_key "tag_maps", "posts"
  add_foreign_key "tag_maps", "tags"
end
