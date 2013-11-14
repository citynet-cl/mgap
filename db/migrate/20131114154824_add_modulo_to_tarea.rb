class AddModuloToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :modulo_id, :integer
  end
end
