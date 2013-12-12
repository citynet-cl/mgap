class AddDeletedAtToProyecto < ActiveRecord::Migration
  def change
    add_column :proyectos, :deleted_at, :datetime
  end
end
