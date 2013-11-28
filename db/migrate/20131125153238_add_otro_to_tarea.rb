class AddOtroToTarea < ActiveRecord::Migration
  def change
    add_reference :tareas, :otro, index: true
  end
end
