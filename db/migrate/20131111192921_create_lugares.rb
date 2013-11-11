class CreateLugares < ActiveRecord::Migration
  def change
    create_table :lugares do |t|
      t.string :nombre
      t.string :ciudad
      t.string :area
      t.string :planta
      t.references :cliente, index: true

      t.timestamps
    end
  end
end
