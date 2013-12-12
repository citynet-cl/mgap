class AddEstadoToProyecto < ActiveRecord::Migration
  def change
    add_column :proyectos, :estado, :boolean
  end
end
