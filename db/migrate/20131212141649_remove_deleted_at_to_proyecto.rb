class RemoveDeletedAtToProyecto < ActiveRecord::Migration
  def change
    remove_column :proyectos, :deleted_at, :string
  end
end
