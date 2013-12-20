class Listados1Controller < ApplicationController
  before_filter :authorize
  def index
	  @tareas_listado1 = Tarea.order('fecha_registro DESC')
  end
end
