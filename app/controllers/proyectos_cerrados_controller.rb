class ProyectosCerradosController < ApplicationController
  before_filter :authorize
	def index
		@proyectos_c = Proyecto.where(:estado => true)
	end

	def show
		@proyecto_c = Proyecto.find(params[:id])
	end
end
