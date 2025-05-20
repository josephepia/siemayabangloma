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

ActiveRecord::Schema[8.0].define(version: 2025_05_17_162444) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "operation_id", null: false
    t.bigint "resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_id"], name: "index_authorizations_on_operation_id"
    t.index ["resource_id"], name: "index_authorizations_on_resource_id"
    t.index ["user_id"], name: "index_authorizations_on_user_id"
  end

  create_table "identification_types", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_identification_types_on_name", unique: true
  end

  create_table "identifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "identification_type_id", null: false
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identification_type_id"], name: "index_identifications_on_identification_type_id"
    t.index ["user_id"], name: "index_identifications_on_user_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privileges", force: :cascade do |t|
    t.bigint "permission_id", null: false
    t.bigint "operation_id", null: false
    t.bigint "resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_id"], name: "index_privileges_on_operation_id"
    t.index ["permission_id"], name: "index_privileges_on_permission_id"
    t.index ["resource_id"], name: "index_privileges_on_resource_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "entity_type", null: false
    t.boolean "is_visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type"], name: "index_resources_on_entity_type", unique: true
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "middle_name"
    t.string "paternal_name"
    t.string "maternal_name"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authorizations", "operations"
  add_foreign_key "authorizations", "resources"
  add_foreign_key "authorizations", "users"
  add_foreign_key "identifications", "identification_types"
  add_foreign_key "identifications", "users"
  add_foreign_key "privileges", "operations"
  add_foreign_key "privileges", "permissions"
  add_foreign_key "privileges", "resources"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
