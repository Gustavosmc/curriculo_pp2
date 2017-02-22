class CandidatosController < ApplicationController
  before_action :set_candidato, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_usuario!

  # GET /candidatos
  # GET /candidatos.json
  def index
    @candidatos = Candidato.all
  end

  # GET /candidatos/1
  # GET /candidatos/1.json
  def show
  end
  
  def new
    @candidato = Candidato.new(candidato_params)
  end

  # POST /candidatos
  # POST /candidatos.json
  def create
    @candidato = Candidato.new(candidato_params)

    respond_to do |format|
      if @candidato.save
      else
        format.html { render :new }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /candidatos/1
  # DELETE /candidatos/1.json
  def destroy
    @candidato.status = 0
    @candidato.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidato
      @candidato = Candidato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidato_params
      params.require(:candidato).permit(:observacao, :vaga, :usuario)
    end
end
