class AddHhToEtapa < ActiveRecord::Migration
  def change
    add_column :etapas, :hh, :integer
  end
end
