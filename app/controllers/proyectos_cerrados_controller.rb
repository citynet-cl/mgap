class ProyectosCerradosController < ApplicationController
  before_action :set_proyecto_c, only: [:show, :edit, :update, :destroy]
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
			format.html { redirect_to proyectos_cerrados_path, notice: 'Proyecto cerrado anulado.' }
		end
	end

  private
    def set_proyecto_c
      @proyecto_c = Proyecto.find(params[:id])
    end
end
