class TipoTareasController < ApplicationController
  before_action :set_tipo_tarea, only: [:show, :edit, :update, :destroy]

  # GET /tipo_tareas
  # GET /tipo_tareas.json
  def index
    @tipo_tareas = TipoTarea.all
  end

  # GET /tipo_tareas/1
  # GET /tipo_tareas/1.json
  def show
  end

  # GET /tipo_tareas/new
  def new
    @tipo_tarea = TipoTarea.new
  end

  # GET /tipo_tareas/1/edit
  def edit
  end

  # POST /tipo_tareas
  # POST /tipo_tareas.json
  def create
    @tipo_tarea = TipoTarea.new(tipo_tarea_params)

    respond_to do |format|
      if @tipo_tarea.save
        format.html { redirect_to @tipo_tarea, notice: 'Tipo tarea was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tipo_tarea }
      else
        format.html { render action: 'new' }
        format.json { render json: @tipo_tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_tareas/1
  # PATCH/PUT /tipo_tareas/1.json
  def update
    respond_to do |format|
      if @tipo_tarea.update(tipo_tarea_params)
        format.html { redirect_to @tipo_tarea, notice: 'Tipo tarea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tipo_tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_tareas/1
  # DELETE /tipo_tareas/1.json
  def destroy
    @tipo_tarea.destroy
    respond_to do |format|
      format.html { redirect_to tipo_tareas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_tarea
      @tipo_tarea = TipoTarea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_tarea_params
      params.require(:tipo_tarea).permit(:nombre)
    end
end
