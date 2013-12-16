class AddDeletedAtToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :deleted_at, :datetime
  end
end
