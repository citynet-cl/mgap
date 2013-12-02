class Listados6Controller < ApplicationController
  def index
	  @tareas_listado = Tarea.order('id DESC')
	  @tareas_o = @tareas_listado.where("otro_id IS NOT NULL").group_by { |t| t.otro_id }
  end
end
