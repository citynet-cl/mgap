class AddColumnProyectoidToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :proyecto_id, :integer
  end
end
