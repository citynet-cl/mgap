class LugaresController < ApplicationController
  before_action :set_lugar#, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  load_and_authorize_resource

  # GET /lugares
  # GET /lugares.json
  def index
	  @lugares = @cliente.lugares
  end

  # GET /lugares/1
  # GET /lugares/1.json
  def show
	  @lugar = @cliente.lugares.find(params[:id])
  end

  # GET /lugares/new
  def new
	  @lugar = @cliente.lugares.build
  end

  # GET /lugares/1/edit
  def edit
	  @lugar = @cliente.lugares.find(params[:id])
  end

  # POST /lugares
  # POST /lugares.json
  def create
	  @lugar = @cliente.lugares.build(params[:lugar])
    #@lugar = Lugar.new(lugar_params)

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

  # PATCH/PUT /lugares/1
  # PATCH/PUT /lugares/1.json
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

  # DELETE /lugares/1
  # DELETE /lugares/1.json
  def destroy
	  @lugar = @cliente.lugares.find(params[:id])
	  @lugar.destroy

    respond_to do |format|
      format.html { redirect_to cliente_lugares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lugar
	    @cliente = Cliente.find(params[:cliente_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lugar_params
      params.require(:lugar).permit(:nombre, :ciudad, :area, :planta, :cliente_id)
    end
end
