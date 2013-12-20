class ResponsablesController < ApplicationController
  before_action :set_cliente#, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  load_and_authorize_resource

  def index
	  @responsables = @cliente.responsables
  end

  def show
	  @responsable = @cliente.responsables.find(params[:id])
  end

  def new
	  @cliente = Cliente.find(params[:cliente_id])
	  @responsable = @cliente.responsables.build
  end

  def edit
	  @responsable = @cliente.responsables.find(params[:id])
  end

  def create
	  @responsable = @cliente.responsables.build(params[:responsable])

    respond_to do |format|
      if @responsable.save
        format.html { redirect_to cliente_responsables_path, notice: 'Lugar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @responsable }
      else
        format.html { render action: 'new' }
        format.json { render json: @responsable.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
	  @responsable = @cliente.responsables.find(params[:id])
    respond_to do |format|
      if @responsable.update(responsable_params)
        format.html { redirect_to cliente_responsables_path, notice: 'Lugar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @responsable.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	  @responsable = @cliente.responsables.find(params[:id])
	  @responsable.destroy

    respond_to do |format|
      format.html { redirect_to cliente_responsables_url }
      format.json { head :no_content }
    end
  end

  private
    def set_cliente
	    @cliente = Cliente.find(params[:cliente_id])
    end

    def responsable_params
      params.require(:responsable).permit(:nombre, :email, :fono, :cliente_id)
    end
end
