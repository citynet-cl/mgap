class ReportesController < ApplicationController
  before_filter :authorize
  #load_and_authorize_resource

  def index
	  @tareas = Tarea.find(:all, :order => :proyecto_id)
	  #@tareas = Tarea.find(:all, :order => :proyecto_id).to_a.page(params[:page]).per_page(5)
	  @tareas_listado_completo = Tarea.order('id DESC')
	  #@tareas_listado = Tarea.order(ordenar_columna + ' ' + ordenar_direccion).search(params[:search]).page(params[:page]).per_page(8)
	  #@tareas_listado = Tarea.order('id DESC')
	  #@tareas_mes = @tareas_listado.group_by { |t| t.fecha_registro.beginning_of_month }
	  #@tareas_d = @tareas_listado.group_by { |t| t.user_id }
	  #@tareas_p = @tareas_listado.where("proyecto_id IS NOT NULL").group_by { |t| t.proyecto_id }
	  #@tareas_m = @tareas_listado.where("modulo_id IS NOT NULL").group_by { |t| t.modulo_id }
	  #@tareas_o = @tareas_listado.where("otro_id IS NOT NULL").group_by { |t| t.otro_id }
	  #respond_to do |format|
	#	  format.html
	#	  format.csv { send_data @tareas_mes.to_csv }
	#	  format.xls 
	 # end
  end
end
