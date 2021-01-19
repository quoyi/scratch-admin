# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_19_064622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "status", default: 0
    t.text "desc"
    t.bigint "superior_id"
    t.string "classifiable_type"
    t.bigint "classifiable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classifiable_type", "classifiable_id"], name: "index_categories_on_classifiable"
    t.index ["superior_id", "code"], name: "index_categories_on_superior_id_and_code", unique: true
    t.index ["superior_id", "name"], name: "index_categories_on_superior_id_and_name", unique: true
    t.index ["superior_id"], name: "index_categories_on_superior_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "status", default: 0
    t.integer "mold", default: 0
    t.integer "seq", default: 0
    t.integer "juniors_count", default: 0
    t.text "intro"
    t.text "desc"
    t.bigint "superior_id"
    t.bigint "prev_id"
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_courses_on_creator_id"
    t.index ["prev_id"], name: "index_courses_on_prev_id"
    t.index ["superior_id", "code"], name: "index_courses_on_superior_id_and_code", unique: true
    t.index ["superior_id", "name"], name: "index_courses_on_superior_id_and_name", unique: true
    t.index ["superior_id"], name: "index_courses_on_superior_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "status", default: 0
    t.integer "mold", default: 0
    t.bigint "used", default: 0
    t.json "info"
    t.bigint "category_id"
    t.bigint "uploader_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_materials_on_category_id"
    t.index ["code"], name: "index_materials_on_code", unique: true
    t.index ["name"], name: "index_materials_on_name", unique: true
    t.index ["uploader_id"], name: "index_materials_on_uploader_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.integer "status", default: 0
    t.text "desc"
    t.text "intro"
    t.string "contacts"
    t.string "mobile"
    t.bigint "superior_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code", "superior_id"], name: "index_organizations_on_code_and_superior_id", unique: true
    t.index ["name", "superior_id"], name: "index_organizations_on_name_and_superior_id", unique: true
    t.index ["superior_id"], name: "index_organizations_on_superior_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "status", default: 0
    t.text "intro"
    t.text "desc"
    t.string "namespace"
    t.string "controller"
    t.string "action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_permissions_on_code", unique: true
    t.index ["name"], name: "index_permissions_on_name", unique: true
  end

  create_table "permissions_roles", id: false, force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "role_id"
    t.index ["permission_id", "role_id"], name: "index_permissions_roles_on_permission_id_and_role_id", unique: true
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id"
    t.index ["role_id"], name: "index_permissions_roles_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "status", default: 0
    t.text "intro"
    t.text "desc"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id", "code"], name: "index_roles_on_organization_id_and_code", unique: true
    t.index ["organization_id", "name"], name: "index_roles_on_organization_id_and_name", unique: true
    t.index ["organization_id"], name: "index_roles_on_organization_id"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "user_id"
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", unique: true
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "desc"
    t.boolean "preset", default: false
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nick"
    t.string "mobile"
    t.integer "gender", default: 0
    t.string "token"
    t.integer "status", default: 0
    t.integer "role", default: 0
    t.boolean "guest", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["guest"], name: "index_users_on_guest"
    t.index ["mobile"], name: "index_users_on_mobile", unique: true
    t.index ["nick"], name: "index_users_on_nick"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
