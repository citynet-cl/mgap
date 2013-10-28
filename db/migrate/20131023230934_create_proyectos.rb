class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.integer :hh
      t.text :descripcion

      t.timestamps
    end
  end
end
