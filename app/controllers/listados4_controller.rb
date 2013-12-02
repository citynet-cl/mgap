class Listados4Controller < ApplicationController
  def index
	  @tareas_listado = Tarea.order('id DESC')
	  @tareas_p = @tareas_listado.where("proyecto_id IS NOT NULL").group_by { |t| t.proyecto_id }
  end
end
