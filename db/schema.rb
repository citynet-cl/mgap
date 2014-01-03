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

ActiveRecord::Schema.define(version: 20131220144611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rut"
    t.string   "email"
    t.date     "fecha_registro"
    t.string   "direccion"
    t.integer  "fono"
    t.datetime "deleted_at"
  end

  create_table "etapas", force: true do |t|
    t.string   "nombre"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "hh"
  end

  add_index "etapas", ["proyecto_id"], name: "index_etapas_on_proyecto_id", using: :btree

  create_table "lugares", force: true do |t|
    t.string   "nombre"
    t.string   "ciudad"
    t.string   "area"
    t.string   "planta"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lugares", ["cliente_id"], name: "index_lugares_on_cliente_id", using: :btree

  create_table "proyectos", force: true do |t|
    t.string   "nombre"
    t.integer  "hh"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "cliente_id"
    t.boolean  "estado"
    t.datetime "deleted_at"
  end

  create_table "responsables", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "fono"
    t.integer  "lugar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responsables", ["lugar_id"], name: "index_responsables_on_lugar_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tareas", force: true do |t|
    t.integer  "hh"
    t.text     "actividad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "email"
    t.integer  "proyecto_id"
    t.integer  "user_id"
    t.string   "nombre"
    t.text     "observaciones"
    t.date     "fecha_registro"
    t.string   "responsable_planta"
    t.string   "lugar_id"
    t.string   "responsable_sistema"
    t.integer  "cliente_id"
    t.string   "modulo"
    t.datetime "deleted_at"
    t.integer  "etapa_id"
    t.integer  "tipo_tarea_id"
  end

  create_table "tipo_tareas", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "usuario"
    t.string   "nombre"
    t.string   "apellido"
    t.boolean  "activo"
  end

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
