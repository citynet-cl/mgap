class Listados3Controller < ApplicationController
  def index
	  @tareas_listado = Tarea.order('id DESC')
	  @tareas_d = @tareas_listado.group_by { |t| t.user_id }
  end
end
