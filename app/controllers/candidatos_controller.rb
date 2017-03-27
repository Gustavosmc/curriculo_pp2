class CandidatosController < ApplicationController
    before_action :set_candidato, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_usuario!

  # GET /candidatos
  # GET /candidatos.json
  def index
    @candidatos = Candidato.where(usuario_id: current_usuario.id).
                  where("status = ? or status = ?", 1, 2)
  end

  # GET /candidatos/1
  # GET /candidatos/1.json
  def show
  end
  
  def new
    @candidato = Candidato.new
    @vaga = Vaga.find_by_id(params[:vaga])
    loc_candidato = Candidato.where(vaga_id: @vaga.id).where(usuario_id: current_usuario.id).first
    if loc_candidato
      if loc_candidato.status == "AGUARDANDO" or loc_candidato.status == "ELIMINADO"
        redirect_to candidatos_url, notice: 'Você já está cadastrado nesta vaga'
      elsif loc_candidato.status != "ELIMINADO"
        loc_candidato.update(status: 1)
        redirect_to candidatos_url, notice: 'Você recandidatou a esta vaga, sua objeção desta vaga continua a mesma,
              clique em editar para altera-la'
      end
    end
  end
  

  # POST /candidatos
  # POST /candidatos.json
  def create
    @candidato = Candidato.new(candidato_params)
    @candidato.usuario_id = current_usuario.id
    @candidato.status = 1
     respond_to do |format|
      if Candidato.exists? usuario_id: @candidato.usuario_id, vaga_id: @candidato.vaga_id
        format.html { redirect_to candidatos_url, notice: 'Candidato já existe' }
        format.json { render :show, status: :created, location: @candidato }
      elsif @candidato.save
        format.html { redirect_to candidatos_url, notice: 'Registro na vaga realizado com sucesso' }
        format.json { render :show, status: :created, location: @candidato }
      else
        format.html { render :new }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
    end
  
  end

  def edit
    @vaga = @candidato.vaga
  end

  # PATCH/PUT /curriculos/1
  # PATCH/PUT /curriculos/1.json
  def update
    respond_to do |format|
      if @candidato.update(candidato_params)
        format.html { redirect_to candidatos_url, notice: 'Candidato atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  # Modificado não deleta apenas muda o status do candidato
  # DELETE /candidatos/1
  # DELETE /candidatos/1.json
  def destroy
    
    respond_to do |format|
      if @candidato.status == "ELIMINADO"
        format.html { redirect_to candidatos_url, notice: 'Você já não foi desclassificado desta vaga' }
      elsif
        @candidato.status = 0
        if @candidato.save
          format.html { redirect_to candidatos_url, notice: 'Registro cancelado com sucesso' }
        end
      end
    end
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
