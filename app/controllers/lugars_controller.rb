class LugarsController < ApplicationController
  before_action :set_lugar, only: [:show, :edit, :update, :destroy]

  # GET /lugars
  # GET /lugars.json
  def index
    @lugars = Lugar.all
  end

  # GET /lugars/1
  # GET /lugars/1.json
  def show
  end

  # GET /lugars/new
  def new
    @lugar = Lugar.new
  end

  # GET /lugars/1/edit
  def edit
  end

  # POST /lugars
  # POST /lugars.json
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

  # PATCH/PUT /lugars/1
  # PATCH/PUT /lugars/1.json
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

  # DELETE /lugars/1
  # DELETE /lugars/1.json
  def destroy
    @lugar.destroy
    respond_to do |format|
      format.html { redirect_to lugars_url }
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
      params.require(:lugar).permit(:nombre, :ciudad, :area, :planta, :belongs_to)
    end
end
