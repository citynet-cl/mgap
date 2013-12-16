class AddEtapaToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :etapa_id, :integer
  end
end
