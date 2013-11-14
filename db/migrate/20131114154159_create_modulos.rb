class CreateModulos < ActiveRecord::Migration
  def change
    create_table :modulos do |t|
      t.string :nombre
      t.text :descripcion
      t.references :proyecto, index: true

      t.timestamps
    end
  end
end
