class AddLugarToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :lugar_id, :string
  end
end
