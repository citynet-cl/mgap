class CreateTipoTareas < ActiveRecord::Migration
  def change
    create_table :tipo_tareas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
