class CcccsController < ApplicationController
  before_action :set_cccc, only: [:show, :edit, :update, :destroy]

  # GET /ccccs
  # GET /ccccs.json
  def index
    @ccccs = Cccc.all
  end

  # GET /ccccs/1
  # GET /ccccs/1.json
  def show
  end

  # GET /ccccs/new
  def new
    @cccc = Cccc.new
  end

  # GET /ccccs/1/edit
  def edit
  end

  # POST /ccccs
  # POST /ccccs.json
  def create
    @cccc = Cccc.new(cccc_params)

    respond_to do |format|
      if @cccc.save
        format.html { redirect_to @cccc, notice: 'Cccc was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cccc }
      else
        format.html { render action: 'new' }
        format.json { render json: @cccc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ccccs/1
  # PATCH/PUT /ccccs/1.json
  def update
    respond_to do |format|
      if @cccc.update(cccc_params)
        format.html { redirect_to @cccc, notice: 'Cccc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cccc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ccccs/1
  # DELETE /ccccs/1.json
  def destroy
    @cccc.destroy
    respond_to do |format|
      format.html { redirect_to ccccs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cccc
      @cccc = Cccc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cccc_params
      params.require(:cccc).permit(:nombre, :algo, :hm, :nacimiento, :edad)
    end
end
