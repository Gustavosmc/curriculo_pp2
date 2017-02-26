class CandidatosController < ApplicationController
  before_action :set_candidato, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_usuario!

  # GET /candidatos
  # GET /candidatos.json
  def index
    @candidatos = Candidato.where(usuario_id: current_usuario.id)
  end

  # GET /candidatos/1
  # GET /candidatos/1.json
  def show
  end
  
  def new
    @candidato = Candidato.new
    @vaga = Vaga.find_by_id(params[:vaga])
    if Candidato.where(vaga_id: @vaga.id).where(usuario_id: current_usuario.id).count > 0
      redirect_to candidatos_url, notice: 'Você ja está cadastrado nesta vaga' 
    end
  end

  # POST /candidatos
  # POST /candidatos.json
  def create
    @candidato = Candidato.new(candidato_params)
    @candidato.usuario_id = current_usuario.id
     respond_to do |format|
      if @candidato.save
        format.html { redirect_to candidatos_url, notice: 'Registro na vaga realizado com sucesso' }
        format.json { render :show, status: :created, location: @candidato }
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
      params.require(:candidato).permit(:observacao, :vaga_id)
    end
end
