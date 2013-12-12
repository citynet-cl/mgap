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

ActiveRecord::Schema.define(version: 20131212230054) do

  create_table "aers", force: true do |t|
    t.string   "nombre"
    t.boolean  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rut"
    t.string   "email"
    t.string   "direccion"
    t.integer  "fono"
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
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "otros", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
  end

  add_index "otros", ["cliente_id"], name: "index_otros_on_cliente_id"

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
    t.boolean  "estado"
    t.datetime "deleted_at"
  end

  create_table "responsables", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "fono"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "responsable_planta_id"
    t.integer  "hh"
    t.text     "actividad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proyecto_id"
    t.integer  "user_id"
    t.string   "nombre"
    t.text     "observaciones"
    t.date     "fecha_registro"
    t.string   "lugar_id"
    t.string   "responsable_sistema_id"
    t.integer  "modulo_id"
    t.integer  "cliente_id"
    t.integer  "otro_id"
    t.string   "modulo"
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
