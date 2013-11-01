class AddColumnToProyecto < ActiveRecord::Migration
  def change
    add_column :proyectos, :fecha_inicio, :date
    add_column :proyectos, :fecha_fin, :date
  end
end
