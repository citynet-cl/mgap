class ReportesController < ApplicationController
  before_filter :authorize
  #load_and_authorize_resource

  def index
	  @tareas = Tarea.find(:all, :order => :proyecto_id)
	  @proyectos = Proyecto.all
  end
end
