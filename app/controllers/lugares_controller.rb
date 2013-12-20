class LugaresController < ApplicationController
  before_action :set_lugar#, only: [:show, :edit, :update, :destroy]
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
        format.html { redirect_to cliente_lugares_path, notice: 'Lugar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lugar }
      else
        format.html { render action: 'new' }
        format.json { render json: @lugar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
	  @lugar = @cliente.lugares.find(params[:id])
    respond_to do |format|
      if @lugar.update(lugar_params)
        format.html { redirect_to cliente_lugares_path, notice: 'Lugar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lugar.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	  @lugar = @cliente.lugares.find(params[:id])
	  @lugar.destroy

    respond_to do |format|
      format.html { redirect_to cliente_lugares_url }
      format.json { head :no_content }
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
