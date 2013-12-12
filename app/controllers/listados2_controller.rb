class Listados2Controller < ApplicationController
  def index
	  @tareas_listado2 = Tarea.order('id')
	  @tareas_mes = @tareas_listado2.group_by { |t| t.fecha_registro.beginning_of_month }
  end
end
