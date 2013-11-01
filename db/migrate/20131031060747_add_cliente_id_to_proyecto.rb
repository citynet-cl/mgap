class AddClienteIdToProyecto < ActiveRecord::Migration
  def change
    add_column :proyectos, :cliente_id, :integer
  end
end
