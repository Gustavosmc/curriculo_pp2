class CurriculosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_curriculo, only: [:show, :edit, :update, :destroy]
  

  # GET /curriculos/1
  # GET /curriculos/1.json

  def show
    @foto = get_foto
    @usuario = current_usuario
    @mes =@usuario.nascimento.month 
    @naturalidade = get_naturalidade(@usuario.naturalidade.to_s)
    @estadocivil = @usuario.estadocivil ? @usuario.estadocivil : ""
  end


  # GET /curriculos/1/edit
  def edit
    @idiomas = Idioma.all
  end

  # POST /curriculos
  # POST /curriculos.json
  def create
    @curriculo = Curriculo.new(curriculo_params)
    @curriculo.usuario = current_usuario

    respond_to do |format|
      if @curriculo.save
        format.html { redirect_to @curriculo, notice: 'Curriculo was successfully created.' }
        format.json { render :show, status: :created, location: @curriculo }
      else
        format.html { render :new }
        format.json { render json: @curriculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculos/1
  # PATCH/PUT /curriculos/1.json
  def update
    respond_to do |format|
      if @curriculo.update(curriculo_params)
        format.html { redirect_to @curriculo, notice: 'Curriculo atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @curriculo }
      else
        format.html { render :edit }
        format.json { render json: @curriculo.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    
    def get_naturalidade(sigla)
      CountryStateSelect.collect_states('br').each do |s|
        if s[1].to_s.eql? sigla
          return s[0]
        end
      end
      "Não definida"
    end
    
    
    def get_foto
      if not current_usuario.foto.url(:medium).eql? "/images/thumb/missing.png"
        @foto = current_usuario.foto.url(:medium)
      else
        @foto = 'user' 
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculo
      @curriculo = Curriculo.find(current_usuario.curriculo.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculo_params
      params.require(:curriculo).permit(:observacao,
        cargos_attributes: [:id, :descricao, :entidade, :desenvolvimento, :detalhes, :fim, :inicio, :ultimo_sal, :_destroy],
        cargo_pretendidos_attributes: [:id, :descricao, :observacao, :anos_exp, :meses_exp, :dias_exp, :pretensao_sal, :_destroy],
        titulos_attributes: [:id, :ano, :descricao, :desenvolvimento, :entidade, :grau, 
                            :observacao, :duracao, :modalidade, :_destroy],
        idioma_curriculos_attributes: [:id, :idioma_id, :escreve, :fala, :le, :_destroy])
        
    end
end
