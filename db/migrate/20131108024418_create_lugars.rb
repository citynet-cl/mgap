class CreateLugars < ActiveRecord::Migration
  def change
    create_table :lugars do |t|
      t.string :nombre
      t.string :ciudad
      t.string :area
      t.string :planta
      t.cliente :belongs_to

      t.timestamps
    end
  end
end
