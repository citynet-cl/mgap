class Listados1Controller < ApplicationController
  def index
	  @tareas_listado1 = Tarea.order('id DESC')
  end
end
