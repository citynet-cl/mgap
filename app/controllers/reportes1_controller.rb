class Reportes1Controller < ApplicationController
  def index
	  @proyectos = Proyecto.all
  end
end
