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

ActiveRecord::Schema.define(version: 20131114165328) do

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rut"
    t.string   "email"
    t.date     "fecha_registro"
    t.string   "direccion"
    t.integer  "fono"
  end

  create_table "etapas", force: true do |t|
    t.string   "nombre"
    t.integer  "hh"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "etapas", ["proyecto_id"], name: "index_etapas_on_proyecto_id"

  create_table "lugares", force: true do |t|
    t.string   "nombre"
    t.string   "ciudad"
    t.string   "area"
    t.string   "planta"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lugares", ["cliente_id"], name: "index_lugares_on_cliente_id"

  create_table "modulos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "modulos", ["proyecto_id"], name: "index_modulos_on_proyecto_id"

  create_table "proyectos", force: true do |t|
    t.string   "nombre"
    t.integer  "hh"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "cliente_id"
    t.integer  "hhi"
    t.integer  "user_id"
  end

  create_table "responsable_tareas", force: true do |t|
    t.integer  "tarea_id"
    t.integer  "responsable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responsables", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "fono"
    t.integer  "lugar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responsables", ["lugar_id"], name: "index_responsables_on_lugar_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "tareas", force: true do |t|
    t.integer  "hh"
    t.text     "actividad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proyecto_id"
    t.integer  "user_id"
    t.string   "nombre"
    t.text     "observaciones"
    t.datetime "fecha_registro"
    t.string   "lugar_id"
    t.string   "responsable_tarea_id"
    t.integer  "modulo_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "usuario"
    t.string   "nombre"
    t.string   "apellido"
  end

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
