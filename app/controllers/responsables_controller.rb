class ResponsablesController < ApplicationController
  before_action :set_cliente_lugar#, only: [:show, :edit, :update, :destroy]
  ####before_action :set_cliente#, only: [:show, :edit, :update, :destroy]

  # GET /responsable
  # GET /responsable.json
  def index
	  #@lugar = Lugar.find(params[:lugar_id])
	  @responsables = @lugar.responsables
  end

  # GET /responsable/1
  # GET /responsable/1.json
  def show
	  #@lugar = Lugar.find(params[:lugar_id])
	  @responsable = @lugar.responsables.find(params[:id])
  end

  # GET /responsable/new
  def new
	  @lugar = Lugar.find(params[:lugar_id])
	  @responsable = @lugar.responsables.build
  end

  # GET /responsable/1/edit
  def edit
	  #@lugar = Lugar.find(params[:lugar_id])
	  @responsable = @lugar.responsables.find(params[:id])
  end

  # POST /responsable
  # POST /responsable.json
  def create
	  #@lugar = Lugar.find(params[:lugar_id])
	  @responsable = @lugar.responsables.build(params[:responsable])
    #@responsable = Lugar.new(responsable_params)

    respond_to do |format|
      if @responsable.save
        format.html { redirect_to cliente_lugar_responsables_path, notice: 'Lugar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @responsable }
      else
        format.html { render action: 'new' }
        format.json { render json: @responsable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsable/1
  # PATCH/PUT /responsable/1.json
  def update
	  @responsable = @lugar.responsables.find(params[:id])
    respond_to do |format|
      if @responsable.update(responsable_params)
        format.html { redirect_to cliente_lugar_responsables_path, notice: 'Lugar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @responsable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsable/1
  # DELETE /responsable/1.json
  def destroy
	  #@lugar = Lugar.find(params[:lugar_id])
	  @responsable = @lugar.responsables.find(params[:id])
	  @responsable.destroy

    respond_to do |format|
      format.html { redirect_to cliente_lugar_responsables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente_lugar
	    @cliente = Cliente.find(params[:cliente_id])
	    @lugar = @cliente.lugares.find(params[:lugar_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responsable_params
      params.require(:responsable).permit(:nombre, :email, :fono, :lugar_id)
    end
end
