class CreateEtapas < ActiveRecord::Migration
  def change
    create_table :etapas do |t|
      t.string :nombre
      t.belongs_to :proyecto, index: true

      t.timestamps
    end
  end
end
