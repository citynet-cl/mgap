class TareasController < ApplicationController
  before_action :set_tarea, only: [:show, :edit, :update, :destroy]
  before_filter :authorize#, only: [:edit,:update]
  load_and_authorize_resource

  # GET /tareas
  # GET /tareas.json
  def index
	  	@user = User.find(current_user)
		@tareas = @user.tareas.order(:fecha_registro).all.reverse
		@proyectos = Proyecto.all
  end

  # GET /tareas/1
  # GET /tareas/1.json
  def show
  end

  # GET /tareas/new
  def new
    @tarea = Tarea.new
  end

  # GET /tareas/1/edit
  def edit
  end

  # POST /tareas
  # POST /tareas.json
  def create
		@proyectos = Proyecto.all
		#@proyecto = Proyecto.find(params[:proyecto_id])
		#@proyectos = Proyecto.all
		#@user = User.find(session[:user_id])
		#@tarea(:user_id) = @user(:user_id)
	  	@user = User.find(current_user)
		@tarea = @user.tareas.create(tarea_params)

    #@tarea = Tarea.new(tarea_params)

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

  # PATCH/PUT /tareas/1
  # PATCH/PUT /tareas/1.json
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

  # DELETE /tareas/1
  # DELETE /tareas/1.json
  def destroy
    @tarea.destroy
    respond_to do |format|
      format.html { redirect_to tareas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarea
      @tarea = Tarea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarea_params
      params.require(:tarea).permit(:nombre, :hh, :actividad, :proyecto_id, :user_id, :fecha_registro, :observaciones)
    end
end
