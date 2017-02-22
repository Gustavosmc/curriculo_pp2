class Vaga < ApplicationRecord
  belongs_to :setor
  has_many :usuarios
  has_many :usuarios, through: :candidatos
  
  enum especial: { SIM: 1, NÃO: 0}
  enum status: {CANCELADA: 0, ABERTA: 1, FECHADA: 2}
  
end
