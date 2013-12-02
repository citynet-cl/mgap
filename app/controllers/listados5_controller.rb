class Listados5Controller < ApplicationController
  def index
	  @tareas_listado = Tarea.order('id DESC')
	  @tareas_m = @tareas_listado.where("modulo_id IS NOT NULL").group_by { |t| t.modulo_id }
  end
end
