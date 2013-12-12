class AddFechaInicioToEtapa < ActiveRecord::Migration
  def change
    add_column :etapas, :fecha_inicio, :date
  end
end
