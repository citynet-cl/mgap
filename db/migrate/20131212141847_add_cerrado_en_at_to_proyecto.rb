class AddCerradoEnAtToProyecto < ActiveRecord::Migration
  def change
    add_column :proyectos, :cerrado_en, :datetime
  end
end
