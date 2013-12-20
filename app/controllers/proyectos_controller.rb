class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]
  before_filter :authorize#, only: [:edit,:update]
  load_and_authorize_resource

  def index
    @proyectos = Proyecto.where(:estado => false)
    @proyectos_t = Proyecto.order(:nombre)
  end

  def show
  end

  def new
    @proyecto = Proyecto.new
    @proyecto.etapas.build
  end

  def edit
  end

  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to proyectos_path, notice: 'Proyecto was successfully created.' }
        format.json { render action: 'show', status: :created, location: @proyecto }
      else
        format.html { render action: 'new' }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to proyectos_path, notice: 'Proyecto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url }
      format.json { head :no_content }
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
