class CreateAaas < ActiveRecord::Migration
  def change
    create_table :aaas do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
