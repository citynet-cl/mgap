class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  load_and_authorize_resource

  def index
    @proyectos = Proyecto.where(:estado => false)
    @proyectos_t = Proyecto.order(:nombre)
  end

  def show
      @proyecto = Proyecto.find(params[:id])
      @etapas = @proyecto.etapas
  end

  def new
    @proyecto = Proyecto.new
    @proyecto.etapas.build
  end

  def edit
  end

  def create
    @proyecto = Proyecto.new(proyecto_params)
    @proyecto.update_attributes(estado: false)

    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to proyectos_path, notice: 'Proyecto registrado exitosamente.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to proyectos_path, notice: 'Proyecto editado exitosamente.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'Proyecto anulado.' }
    end
  end


  def cerrar
	  @proyecto = Proyecto.find(params[:id])
	  unless @proyecto.cerrado? 
		  @proyecto.update_attributes(estado: true)
		  redirect_to proyectos_cerrados_path
	  else
		  redirect_to proyectos_url
	  end
  end


  private
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    def proyecto_params
      params.require(:proyecto).permit(:nombre, :hh, :descripcion, :cliente_id, :fecha_inicio, :fecha_fin, :estado, etapas_attributes: [:id, :nombre, :fecha_inicio, :fecha_fin, :hh,  :_destroy])
    end
end
