class VagasController < ApplicationController
  before_action :set_vaga, only: [:show, :edit, :update, :destroy]

  # GET /vagas
  # GET /vagas.json
  def index
    @vagas = Vaga.search(params[:search]).paginate(:per_page => 8, :page => params[:page])

    # @vagas = Vaga.paginate(:page => params[:page])
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
