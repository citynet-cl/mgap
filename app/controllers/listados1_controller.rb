class Listados1Controller < ApplicationController
  def index
	  @tareas_listado1 = Tarea.order('fecha_registro DESC')

  end
end
