class TareasController < ApplicationController
  before_action :set_tarea, only: [:show, :edit, :update, :destroy]
  before_filter :authorize#, only: [:edit,:update]
  load_and_authorize_resource
  
  def index
	  if current_user.has_role? :admin
		  @tareas = Tarea.order('fecha_registro ASC')
	  else
	  	@user = User.find(current_user)
		@tareas = @user.tareas.order('id DESC')
	  end
  end

  def show
  end

  def new
    @tarea = Tarea.new
    @clientes = Cliente.joins(:proyectos).where(proyectos: {:estado => false}).distinct
  end

  def edit
  end
  
  def create
    @user = User.find(current_user)
    @tarea = @user.tareas.create(tarea_params)

    respond_to do |format|
      if @tarea.save
      format.html { redirect_to tareas_path, notice: 'Tarea was successfully created.' }
      format.json { render action: 'show', status: :created, location: @tarea }
     else
       format.html { render action: 'new' }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tarea.update(tarea_params)
        format.html { redirect_to @tarea, notice: 'Tarea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tarea.destroy
    respond_to do |format|
      format.html { redirect_to tareas_url }
      format.json { head :no_content }
    end
  end

  def copiar
	@tarea_a_copiar = Tarea.find(params[:id])
	@tarea = @tarea_a_copiar.dup
        @clientes = Cliente.joins(:proyectos).where(proyectos: {:estado => false}).distinct
	render 'copia'
  end


  private
    def set_tarea
      @tarea = Tarea.find(params[:id])
    end

    def tarea_params
      params.require(:tarea).permit(:nombre, :hh, :actividad, :proyecto_id, :user_id, :fecha_registro, :observaciones, :lugar_id, :responsable_planta_id, :responsable_sistema_id, :cliente_id, :modulo, :etapa_id, :tipo_tarea_id)
    end

end
