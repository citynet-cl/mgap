class Listados2Controller < ApplicationController
  before_filter :authorize
  def index
	  @tareas_listado2 = Tarea.order('id')
	  #@tareas_mes = @tareas_listado2.group_by { |t| t.fecha_registro.beginning_of_month }
	  @tareas_d = @tareas_listado2.group_by { |t| t.user_id }
  end
end
