class CreateCcccs < ActiveRecord::Migration
  def change
    create_table :ccccs do |t|
      t.string :nombre
      t.text :algo
      t.boolean :hm
      t.date :nacimiento
      t.integer :edad

      t.timestamps
    end
  end
end
