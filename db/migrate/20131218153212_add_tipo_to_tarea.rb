class AddTipoToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :tipo_tarea_id, :integer
  end
end
