class AddColumnToProyecto < ActiveRecord::Migration
  def change
    add_column :proyectos, :hhi, :integer
  end
end
