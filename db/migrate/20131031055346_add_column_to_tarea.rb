class AddColumnToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :nombre, :string
    add_column :tareas, :observaciones, :text
    add_column :tareas, :fecha_registro, :date
  end
end
