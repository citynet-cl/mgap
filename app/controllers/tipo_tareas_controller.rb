class TipoTareasController < ApplicationController
  before_action :set_tipo_tarea, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  load_and_authorize_resource

  def index
    @tipo_tareas = TipoTarea.all
  end

  def show
  end

  def new
    @tipo_tarea = TipoTarea.new
  end

  def edit
  end

  def create
    @tipo_tarea = TipoTarea.new(tipo_tarea_params)

    respond_to do |format|
      if @tipo_tarea.save
        format.html { redirect_to @tipo_tarea, notice: 'Tipo tarea creada exitosamente.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @tipo_tarea.update(tipo_tarea_params)
        format.html { redirect_to @tipo_tarea, notice: 'Tipo tarea editada exitosamente.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @tipo_tarea.destroy
    respond_to do |format|
      format.html { redirect_to tipo_tareas_url, notice: "Tipo de tarea anulada"}
    end
  end

  private
    def set_tipo_tarea
      @tipo_tarea = TipoTarea.find(params[:id])
    end

    def tipo_tarea_params
      params.require(:tipo_tarea).permit(:nombre)
    end
end
