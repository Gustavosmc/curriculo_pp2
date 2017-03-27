class Vaga < ApplicationRecord
  validates :descricao, presence: true, length: { maximum: 80 }
  validates :setor, presence: true
  
  # ActiveRecord relacionamentos
  belongs_to :setor
  
  has_many :candidatos
  has_many :usuarios, through: :candidatos
  
  # Enums
  enum especial: { SIM: 1, NAO: 0}
  enum status: {CANCELADA: 0, ABERTA: 1, OCUPADA: 2}
  
  
end
