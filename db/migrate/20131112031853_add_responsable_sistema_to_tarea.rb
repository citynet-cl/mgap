class AddResponsableSistemaToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :responsable_sistema, :string
  end
end
