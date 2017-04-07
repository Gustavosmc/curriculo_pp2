class VagasController < ApplicationController
  before_action :set_vaga, only: [:show, :edit, :update, :destroy]

  # GET /vagas
  # GET /vagas.json
  def index
    @q = Vaga.ransack(params[:q])
    @vagas = @q.result.includes(:setor)
    @vagas = @vagas.where(status: 1) # Status Vaga ABERTA
    @vagas = @vagas.paginate(per_page: 10, page: params[:page])
    
  end

  # GET /vagas/1
  # GET /vagas/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vaga
      @vaga = Vaga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vaga_params
      params.fetch(:vaga, {})
    end
end
