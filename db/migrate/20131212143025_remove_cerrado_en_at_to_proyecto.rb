class RemoveCerradoEnAtToProyecto < ActiveRecord::Migration
  def change
    remove_column :proyectos, :cerrado_en, :string
  end
end
