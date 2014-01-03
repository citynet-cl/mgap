class LugaresController < ApplicationController
  before_action :set_lugar
  before_filter :authorize
  load_and_authorize_resource

  def index
	  @lugares = @cliente.lugares
  end
  
  def show
	  @lugar = @cliente.lugares.find(params[:id])
  end

  def new
	  @lugar = @cliente.lugares.build
  end

  def edit
	  @lugar = @cliente.lugares.find(params[:id])
  end

  def create
	  @lugar = @cliente.lugares.build(params[:lugar])

    respond_to do |format|
      if @lugar.save
        format.html { redirect_to cliente_lugares_path, notice: 'Lugar creado exitosamente.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
	  @lugar = @cliente.lugares.find(params[:id])
    respond_to do |format|
      if @lugar.update(lugar_params)
        format.html { redirect_to cliente_lugares_path, notice: 'Lugar editado exitosamente.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
	  @lugar = @cliente.lugares.find(params[:id])
	  @lugar.destroy

    respond_to do |format|
      format.html { redirect_to cliente_lugares_url, notice: 'Lugar anulado.' }
    end
  end

  private
    def set_lugar
	    @cliente = Cliente.find(params[:cliente_id])
    end

    def lugar_params
      params.require(:lugar).permit(:nombre, :ciudad, :area, :planta, :cliente_id)
    end
end
