class ReportesController < ApplicationController
  before_filter :authorize
  #load_and_authorize_resource

  def index
	  #@tareas = Tarea.find(:all, :order => :proyecto_id).to_a.page(params[:page]).per_page(5)
	  @tareas = Tarea.order(ordenar_columna + ' ' + ordenar_direccion).search(params[:search]).page(params[:page]).per_page(8)
	  @proyectos = Proyecto.all
	  respond_to do |format|
		  format.html
		  format.csv { send_data @tareas.to_csv }
		  #format.xls { send_data @tareas.to_csv(col_sep: "\t") }
		  format.xls 
	  end
  end
end
