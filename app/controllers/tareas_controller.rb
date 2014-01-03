class TareasController < ApplicationController
  before_action :set_tarea, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  load_and_authorize_resource
  
  def index
	  	@user = User.find(current_user)
		@tareas = @user.tareas.order('id DESC')
  end

  def show
  end

  def new
    @tarea = Tarea.new
    set_clientes
  end

  def edit
  end
  
  def create
    @user = User.find(current_user)
    @tarea = @user.tareas.create(tarea_params)
    set_clientes

    respond_to do |format|
      if @tarea.save
      format.html { redirect_to tareas_path, notice: 'Tarea registrada exitosamente' }
     else
       format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @tarea.update(tarea_params)
        format.html { redirect_to @tarea, notice: 'Tarea was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @tarea.destroy
    respond_to do |format|
      format.html { redirect_to tareas_url, notice: "Tarea anulada" }
    end
  end

  def copiar
	@tarea_a_copiar = Tarea.find(params[:id])
	@tarea = @tarea_a_copiar.dup
	set_clientes
	render 'copia'
  end


  private
    def set_tarea
      @tarea = Tarea.find(params[:id])
    end

    def set_clientes
	    @clientes = Cliente.joins(:proyectos).where(proyectos: {:estado => false}).distinct
    end

    def tarea_params
      params.require(:tarea).permit(:nombre, :hh, :actividad, :proyecto_id, :user_id, :fecha_registro, :observaciones, :lugar_id, :responsable_planta_id, :responsable_sistema_id, :cliente_id, :modulo, :etapa_id, :tipo_tarea_id)
    end

end
