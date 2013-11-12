class AddResponsablePlantaToTarea < ActiveRecord::Migration
  def change
    add_column :tareas, :responsable_planta, :string
  end
end
