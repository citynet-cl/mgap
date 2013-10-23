class AersController < ApplicationController
  before_action :set_aer, only: [:show, :edit, :update, :destroy]

  # GET /aers
  # GET /aers.json
  def index
    @aers = Aer.all
  end

  # GET /aers/1
  # GET /aers/1.json
  def show
  end

  # GET /aers/new
  def new
    @aer = Aer.new
  end

  # GET /aers/1/edit
  def edit
  end

  # POST /aers
  # POST /aers.json
  def create
    @aer = Aer.new(aer_params)

    respond_to do |format|
      if @aer.save
        format.html { redirect_to @aer, notice: 'Aer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @aer }
      else
        format.html { render action: 'new' }
        format.json { render json: @aer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aers/1
  # PATCH/PUT /aers/1.json
  def update
    respond_to do |format|
      if @aer.update(aer_params)
        format.html { redirect_to @aer, notice: 'Aer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aers/1
  # DELETE /aers/1.json
  def destroy
    @aer.destroy
    respond_to do |format|
      format.html { redirect_to aers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aer
      @aer = Aer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aer_params
      params.require(:aer).permit(:email, :password_digest)
    end
end
