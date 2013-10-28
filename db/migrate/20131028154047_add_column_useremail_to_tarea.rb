class AddColumnUseremailToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :email, :integer
  end
end
