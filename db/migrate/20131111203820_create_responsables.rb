class CreateResponsables < ActiveRecord::Migration
  def change
    create_table :responsables do |t|
      t.string :nombre
      t.string :email
      t.integer :fono
      t.references :lugar, index: true

      t.timestamps
    end
  end
end
