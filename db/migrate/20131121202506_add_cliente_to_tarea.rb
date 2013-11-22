class AddClienteToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :cliente_id, :integer
  end
end
