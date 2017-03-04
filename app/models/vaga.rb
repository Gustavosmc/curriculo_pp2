class Vaga < ApplicationRecord
  
  # ActiveRecord relacionamentos
  belongs_to :setor
  
  has_many :candidatos
  has_many :usuarios, through: :candidatos
  
  # Enums
  enum especial: { SIM: 1, NÃO: 0}
  enum status: {CANCELADA: 0, ABERTA: 1, FECHADA: 2}
  
  # Paginação
  self.per_page = 7
  
  
end
