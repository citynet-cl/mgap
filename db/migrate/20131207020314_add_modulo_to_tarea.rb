class AddModuloToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :modulo, :string
  end
end
