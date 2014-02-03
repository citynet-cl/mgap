class ProyectosCerradosController < ApplicationController
  before_filter :authorize
	def index
		@proyectos_c = Proyecto.where(:estado => true)
	end

	def show
		@proyecto_c = Proyecto.find(params[:id])
	end

	def destroy
		@proyecto_c.destroy
		
		respond_to do |format|
			format.html { redirect_to proyectos_url, notice: 'Proyecto anulado.' }
		end
	end
end
