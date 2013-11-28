class OtrosController < ApplicationController
  before_action :set_otro, only: [:show, :edit, :update, :destroy]

  # GET /otros
  # GET /otros.json
  def index
    @otros = Otro.all
  end

  # GET /otros/1
  # GET /otros/1.json
  def show
  end

  # GET /otros/new
  def new
    @otro = Otro.new
  end

  # GET /otros/1/edit
  def edit
  end

  # POST /otros
  # POST /otros.json
  def create
    @otro = Otro.new(otro_params)

    respond_to do |format|
      if @otro.save
        format.html { redirect_to otros_path, notice: 'Otro was successfully created.' }
        format.json { render action: 'show', status: :created, location: @otro }
      else
        format.html { render action: 'new' }
        format.json { render json: @otro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /otros/1
  # PATCH/PUT /otros/1.json
  def update
    respond_to do |format|
      if @otro.update(otro_params)
        format.html { redirect_to otros_path, notice: 'Otro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @otro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /otros/1
  # DELETE /otros/1.json
  def destroy
    @otro.destroy
    respond_to do |format|
      format.html { redirect_to otros_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_otro
      @otro = Otro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def otro_params
      params.require(:otro).permit(:nombre, :descripcion, :cliente_id)
    end
end
