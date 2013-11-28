class CreateOtros < ActiveRecord::Migration
  def change
    create_table :otros do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
