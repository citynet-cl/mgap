class AddColumnUserIdToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :user_id, :integer
  end
end
