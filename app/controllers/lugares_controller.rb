class LugaresController < ApplicationController
  before_action :set_lugar, only: [:show, :edit, :update, :destroy]

  # GET /lugares
  # GET /lugares.json
  def index
    @lugares = Lugar.all
    @clientes = Cliente.all
  end

  # GET /lugares/1
  # GET /lugares/1.json
  def show
  end

  # GET /lugares/new
  def new
    @lugar = Lugar.new
  end

  # GET /lugares/1/edit
  def edit
  end

  # POST /lugares
  # POST /lugares.json
  def create
    @lugar = Lugar.new(lugar_params)

    respond_to do |format|
      if @lugar.save
        format.html { redirect_to @lugar, notice: 'Lugar was successfully created.' }
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
    respond_to do |format|
      if @lugar.update(lugar_params)
        format.html { redirect_to @lugar, notice: 'Lugar was successfully updated.' }
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
    @lugar.destroy
    respond_to do |format|
      format.html { redirect_to lugares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lugar
      @lugar = Lugar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lugar_params
      params.require(:lugar).permit(:nombre, :ciudad, :area, :planta, :cliente_id)
    end
end
