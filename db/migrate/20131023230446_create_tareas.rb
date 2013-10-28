class CreateTareas < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.integer :hh
      t.text :actividad

      t.timestamps
    end
  end
end
