class AddFechaFinToEtapa < ActiveRecord::Migration
  def change
    add_column :etapas, :fecha_fin, :date
  end
end
