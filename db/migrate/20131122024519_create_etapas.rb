class CreateEtapas < ActiveRecord::Migration
  def change
    create_table :etapas do |t|
      t.string :nombre
      t.integer :hh
      t.date :fecha_inicio
      t.date :fecha_fin
      t.references :proyecto, index: true
      t.references :modulo, index: true

      t.timestamps
    end
  end
end
